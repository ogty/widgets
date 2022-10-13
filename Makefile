icon                ?=
size                ?= true

component_name      := $(shell echo $(icon) | awk -f ./tools/capitalizer.awk)
ICONS_URL           := https://raw.githubusercontent.com/twbs/icons/main/icons
ICONS_PATH          := ./src/components/icons
TOOLS_PATH          := ./tools
COMPONENT_EXTENSION := svelte
PROPS               := $(shell echo '<script lang="ts">\n\texport let size\: number;\n<\/script>\n\n')

COMPONENTS_FILE          := components.json
IMPORT_TMP_FILE          := import.tmp
ICON_STATE_TMP_FILE      := iconState.tmp
SETTINGS_START_TMP_FILE  := settings-start.tmp
SETTINGS_CENTER_TMP_FILE := settings-center.tmp

LIB_DIR          := src/lib
ICONS_DIR        := src/components/icons
ATOMS_DIR        := src/components/atoms
ROUTES_DIR       := src/routes
MOLECULES_DIR    := src/components/molecules
COMPONENTS_NAME  := $(shell cat $(COMPONENTS_FILE) | jq -r '.[]["name"]')
COMPONENTS_ICON  := $(shell cat $(COMPONENTS_FILE) | jq -r '.[]["icon"]')
COMPONENTS_STATE := $(shell cat $(COMPONENTS_FILE) | jq -r '.[] | "\t\tisShow" + .name + ",\\n"')

APP_TEMPLATE_DIR  := templates/app
LIST_TEMPLATE_DIR := templates/list
SITE_TEMPLATE_DIR := templates/site

INDEX_CENTER_FILE := index-center.svelte.tmp

STORE_PATH          := templates/stores.ts.tpl
INDEX_END_PATH      := templates/index-end.svelte.tpl
INDEX_START_PATH    := templates/index-start.svelte.tpl
SETTINGS_END_PATH   := templates/settings-end.svelte.tpl
SETTINGS_START_PATH := templates/settings-start.svelte.tpl


define makeSiteComponent
{
	name = $$1;
	icon = $$2;
	url = $$3;
	make = sprintf("make -C $(SITE_TEMPLATE_DIR) icon=%s url=%s", icon, url);
	write = sprintf(" > $(ATOMS_DIR)/%s.svelte", name);
	command = sprintf("%s%s", make, write);
	system(command);
}
endef
export makeSiteComponent

define makeAppComponent
{
	split($$0, array, "@");
	name = array[1];
	icon = array[2];
	path = array[3];
	make = sprintf("make -C $(APP_TEMPLATE_DIR) icon=%s path=\"%s\"", icon, path);
	write = sprintf(" > $(ATOMS_DIR)/%s.svelte", name);
	command = sprintf("%s%s", make, write);
	system(command);
}
endef
export makeAppComponent


start:
	npm run dev

format:
	npm run format

build:
	npm run build

icon:
	@curl -s $(ICONS_URL)/$(icon).svg -o $(component_name).$(COMPONENT_EXTENSION)
ifeq ($(size), true)
	@sed -i "" -e '1s/^/$(PROPS)/' $(component_name).$(COMPONENT_EXTENSION)
	@sed -i "" -e 's/width="16"/width={size}/g' $(component_name).$(COMPONENT_EXTENSION) \
	&& sed -i "" -e 's/height="16"/height={size}/g' $(component_name).$(COMPONENT_EXTENSION)
endif
	@echo '' >> $(component_name).$(COMPONENT_EXTENSION) \
	&& mv $(component_name).$(COMPONENT_EXTENSION) $(ICONS_PATH)

unused:
	@$(TOOLS_PATH)/unused ./src

run:
	@make atoms stores index settings \
	&& npm run format                 \
	&& npm run dev

download-icon:
	@:

atoms:
	@make site-atoms app-atoms

index:
	@make index-center \
	&& make replace-index

settings:
	@make settings-center \
	&& make replace-settings

stores:
	@cat $(COMPONENTS_FILE)                     \
	| jq -r '.[]                                \
	| "export const isShow"                     \
	+ .name                                     \
	+ " = writable("                            \
	+ (.default | tostring)                     \
	+ ");"'                                     \
	> $(ICON_STATE_TMP_FILE)                    \
	&& cat $(STORE_PATH) $(ICON_STATE_TMP_FILE) \
	> $(LIB_DIR)/stores.ts                      \
	&& rm $(ICON_STATE_TMP_FILE)

settings-center:
	@:$(foreach name, $(COMPONENTS_NAME), $(shell \
	make -C '$(LIST_TEMPLATE_DIR)' name=$(name)   \
	>> $(SETTINGS_CENTER_TMP_FILE)))

replace-settings:
	@cat $(SETTINGS_START_PATH)                       \
	| sed 's/import {/import {\n$(COMPONENTS_STATE)/' \
	> $(SETTINGS_START_TMP_FILE)
	@cat $(SETTINGS_START_TMP_FILE) $(SETTINGS_CENTER_TMP_FILE) $(SETTINGS_END_PATH) \
	> $(MOLECULES_DIR)/Settings.svelte                                               \
	&& rm $(SETTINGS_START_TMP_FILE) $(SETTINGS_CENTER_TMP_FILE)

site-atoms:
	@cat $(COMPONENTS_FILE)             \
	| jq '.[] | [select(.url != null)]' \
	| jq -r '.[] | .name + " " + .icon + " " + .url'  \
	| awk "$$makeSiteComponent"

app-atoms:
	@cat $(COMPONENTS_FILE)         \
	| jq -r '.[]                    \
	| (select(.path != null).name)  \
	+ "@"                           \
	+ (select(.path != null).icon)  \
 	+ "@"                           \
 	+ (select(.path != null).path)' \
 	| awk "$$makeAppComponent"

index-center:
	@cat $(COMPONENTS_FILE) \
	| jq -r '.[]            \
	| "\t\t{#if $$isShow"   \
	+ .name                 \
	+ "}\n\t\t\t<"          \
	+ .name                 \
	+ " />\n\t\t{/if}"'     \
	> $(INDEX_CENTER_FILE)

replace-index:
	@$(eval components := $(shell cat $(COMPONENTS_FILE) \
	| jq -r '.[]                                         \
	| "\timport "                                        \
	+ .name                                              \
	+ " from \"@atoms\\/"                                \
	+ .name                                              \
	+ "\\.svelte\";\\n"'))
	@cat $(INDEX_START_PATH)                          \
	| sed 's/import {/import {\n$(COMPONENTS_STATE)/' \
	| sed 's/lang="ts">/lang="ts">\n$(components)/'   \
	> $(IMPORT_TMP_FILE)
	@cat $(IMPORT_TMP_FILE) $(INDEX_CENTER_FILE) $(INDEX_END_PATH) \
	> $(ROUTES_DIR)/index.svelte                                   \
	&& rm $(INDEX_CENTER_FILE) $(IMPORT_TMP_FILE)
