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

define capitalizer
BEGIN {
  numbers[0] = "Zero";
  numbers[1] = "One";
  numbers[2] = "Two";
  numbers[3] = "Three";
  numbers[4] = "Four";
  numbers[5] = "Five";
  numbers[6] = "Six";
  numbers[7] = "Seven";
  numbers[8] = "Eight";
  numbers[9] = "Nine";
  numbers[45] = "FortyFive";
  numbers[90] = "Ninety";
}

function capitalize(word) {
  first_character = substr(word, 0, 1);
  after_second_character = substr(word, 2);
  capitalized = sprintf("%s%s", toupper(first_character), after_second_character);
  return capitalized;
}
                                                                                         
{
  split($$0, array, "-");
  array_length = length(array);

  for (i = 1; i <= array_length; i += 1) {
    capitalized = capitalize(array[i]);
    for (number in numbers) {
      gsub(number, numbers[number], capitalized);
    }
    printf(capitalized);
  }
}
endef
export capitalizer

define svelteTemplate
<script lang="ts">
  export let name: type;
</script>

endef
export svelteTemplate

define svelteReplace
	echo "$$svelteTemplate" | sed -e 's/name/$1/g' -e 's/type/$2/g' | sed -e 's/echo //'
endef 
export svelteReplace

define mergeSvelteProp
	@echo $1 | (echo $2 | diff -DVERSION1 /dev/fd/3 -) 3<&0
endef
export mergeSvelteProp

define diffMergeProp
	@echo $1 | (echo $2 | diff -DVERSION1 /dev/fd/3 -) 3<&0
endef
export diffMergeProp

define makeIcon
{
	command = sprintf("make icon name=%s size=1 color=0 props=false", $$0);
	system(command);
}
endef
export makeIcon


name            ?=
size            ?= 1
color           ?= 0
props           ?= false
ICONS_URL       := https://raw.githubusercontent.com/twbs/icons/main/icons
ICONS_DIR       := src/components/icons
TOOLS_DIR       := tools
COMPONENT_TYPE  := svelte
componentName   := $(shell echo $(name) | awk '$(capitalizer)')
componentFile   := $(shell echo $(componentName).$(COMPONENT_TYPE))
icon_path       := $(ICONS_DIR)/$(componentFile)
svelteSizeProp  := $(call svelteReplace,size,number)
svelteColorProp := $(call svelteReplace,color,string)

COMPONENTS_FILE          := components.json
IMPORT_TMP_FILE          := import.tmp
ICON_STATE_TMP_FILE      := iconState.tmp
SETTINGS_START_TMP_FILE  := settings-start.tmp
SETTINGS_CENTER_TMP_FILE := settings-center.tmp

LIB_DIR          := src/lib
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


run:
	@make atoms stores index settings \
	&& npm run format                 \
	&& npm run dev

start:
	npm run dev

format:
	npm run format

build:
	npm run build

unused:
	@$(TOOLS_DIR)/unused ./src

download-icons:
	@cat $(COMPONENTS_FILE)            \
	| jq -r '.[]                       \
	| (select(.create != false).icon)' \
	| sed 's/\([A-Z]\)/-\1/g'          \
	| sed -e 's/-//'                   \
	| awk '{print(tolower($$0))}'      \
	| awk "$$makeIcon"

icon:
ifeq ($(COMPONENT_TYPE), svelte)
ifeq ($(shell expr $(size) + $(color)), 2)
	@$(call mergeSvelteProp,$(svelteSizeProp),$(svelteColorProp)) \
	| grep -v '^#if'                                              \
	| grep -v '^#endif'                                           \
	| grep -v '^#else'                                            \
	> $(icon_path)
	@curl -s $(ICONS_URL)/$(name).svg              \
	| sed -e 's/width="16"/width={size}/'          \
	| sed -e 's/height="16"/height={size}/'        \
	| sed -e 's/fill="currentColor"/fill={color}/' \
	>> $(icon_path)
else
ifeq ($(size), 1)
	@echo $(svelteSizeProp) > $(icon_path)
	@curl -s $(ICONS_URL)/$(name).svg       \
	| sed -e 's/width="16"/width={size}/'   \
	| sed -e 's/height="16"/height={size}/' \
	>> $(icon_path)
endif
ifeq ($(color), 1)
	@echo $(svelteColorProp) > $(icon_path)z
	@curl -s $(ICONS_URL)/$(name).svg              \
	| sed -e 's/fill="currentColor"/fill={color}/' \
	>> $(icon_path)
endif
ifeq ($(shell expr $(size) + $(color)), 0)
	@curl -s $(ICONS_URL)/$(name).svg -o $(icon_path)
endif
endif
ifeq ($(props), true)
	@cat $(icon_path)                         \
	| sed -e 's/<svg/<svg {\.\.\.$$$$props}/' \
	> $(icon_path).tmp                        \
	&& mv $(icon_path).tmp $(icon_path)
endif
	@sed -i "" -e 's/<\/svg>/<\/svg>\n/' $(icon_path)
endif
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
	@cat $(COMPONENTS_FILE)                           \
	| jq '.[] | [select(.url != null)]'               \
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
	@cat $(COMPONENTS_FILE)                  \
	| jq -r '.[]                             \
	| "\t\t<svelte:component this={$$isShow" \
	+ .name                                  \
	+ " ? "                                  \
	+ .name                                  \
	+ " : Nothing} />"'                      \
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
