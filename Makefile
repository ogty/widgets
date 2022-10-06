icon                ?=
size                ?= true

component_name      := $(shell echo $(icon) | awk -f ./tools/capitalizer.awk)
ICONS_URL           := https://raw.githubusercontent.com/twbs/icons/main/icons
ICONS_PATH          := ./src/components/icons
TOOLS_PATH          := ./tools
COMPONENT_EXTENSION := svelte
PROPS               := $(shell echo '<script lang="ts">\n\texport let size\: number;\n<\/script>\n\n')


run:
	npm run dev

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