# Copyright (C) 2016-2020 Falcon OS
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Versioning System
ifneq ($(filter eng userdebug,$(TARGET_BUILD_VARIANT)),)
    BUILD_DATE := $(shell date +%Y%m%d-%H%M)
else
    BUILD_DATE := $(shell date +%Y%m%d)
endif

ifeq ($(FALCON_BUILDTYPE), OFFICIAL)
   LIST = $(shell cat vendor/aosip/falcon.devices)
    ifeq ($(filter $(CURRENT_DEVICE), $(LIST)), $(CURRENT_DEVICE))
      IS_OFFICIAL=true

    endif
    ifneq ($(IS_OFFICIAL), true)
       $(error Device is not official "$(CURRENT_DEVICE)")
    endif
endif


TARGET_PRODUCT_SHORT := $(subst falcon_,,$(FALCON_BUILDTYPE))

FALCON_BUILDTYPE ?= Skyline-1.0 ❤️
AOSIP_BUILD_VERSION := $(PLATFORM_VERSION)
FALCON_VERSION := $(AOSIP_BUILD_VERSION)-$(FALCON_BUILDTYPE)-$(BUILD_DATE)
ROM_FINGERPRINT := FAlcoN/$(PLATFORM_VERSION)/$(FALCON_BUILDTYPE)/$(shell date -u +%H%M)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
  ro.aosip.build.version=$(AOSIP_BUILD_VERSION) \
  ro.aosip.build.date=$(BUILD_DATE) \
  ro.aosip.buildtype=$(FALCON_BUILDTYPE) \
  ro.aosip.fingerprint=$(ROM_FINGERPRINT) \
  ro.aosip.version=$(FALCON_VERSION) \
  ro.aosip.device=$(FALCON_BUILD) \
  ro.modversion=$(AOSIP_VERSION)

ifneq ($(OVERRIDE_OTA_CHANNEL),)
    PRODUCT_PROPERTY_OVERRIDES += \
        aosip.updater.uri=$(OVERRIDE_OTA_CHANNEL)
endif
