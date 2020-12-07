ifneq ($(wildcard IHP/.*),)
IHP = IHP/lib/IHP
else
IHP = $(shell dirname $$(which RunDevServer))/../lib/IHP
endif

# CSS_FILES += ${IHP}/static/vendor/bootstrap.min.css
# CSS_FILES += ${IHP}/static/vendor/flatpickr.min.css
CSS_FILES += static/app.css

# JS_FILES += ${IHP}/static/vendor/jquery-3.2.1.slim.min.js
# JS_FILES += ${IHP}/static/vendor/timeago.js
# JS_FILES += ${IHP}/static/vendor/popper.min.js
# JS_FILES += ${IHP}/static/vendor/bootstrap.min.js
# JS_FILES += ${IHP}/static/vendor/flatpickr.js
JS_FILES += ${IHP}/static/helpers.js
JS_FILES += ${IHP}/static/vendor/morphdom-umd.min.js
JS_FILES += ${IHP}/static/vendor/turbolinks.js
JS_FILES += ${IHP}/static/vendor/turbolinksInstantClick.js
JS_FILES += ${IHP}/static/vendor/turbolinksMorphdom.js

define tailwindcss
	npx tailwindcss build styles/main.css -o static/app.css -c styles/tailwind.config.js
endef

tailwind-dev:
	ls styles/* | NODE_ENV=development entr $(call tailwindcss)

static/app.css:
	NODE_ENV=production npm ci
	NODE_ENV=production $(call tailwindcss)

# Must Be Last Line
include ${IHP}/Makefile.dist
