FALCON_TARGET_PACKAGE := $(PRODUCT_OUT)/FalconOS-$(FALCON_VERSION).zip

MD5 := prebuilts/build-tools/path/$(HOST_PREBUILT_TAG)/md5sum

.PHONY: fly bacon
fly: otapackage
	$(hide) mv $(INTERNAL_OTA_PACKAGE_TARGET) $(FALCON_TARGET_PACKAGE)
	$(hide) $(MD5) $(FALCON_TARGET_PACKAGE) | cut -d ' ' -f1 > $(FALCON_TARGET_PACKAGE).md5sum
	@echo -e ""
	@echo -e "${cya}Building ${bldcya}FAlcoN ${txtrst}";
	@echo -e ""
	@echo -e ${CL_GRN}"  ________            __                                       ______    _____ _   "
	@echo -e ${CL_GRN}" /        |          /  |                                     /      \  /      \   "
	@echo -e ${CL_GRN}" $$$$$$$$/   ______  $$ |  _______   ______   _______        /$$$$$$  |/$$$$$$  |  "
	@echo -e ${CL_GRN}" $$ |__     /      \ $$ | /       | /      \ /       \       $$ |  $$ |$$ \__$$/   "
	@echo -e ${CL_GRN}" $$    |    $$$$$$  |$$ |/$$$$$$$/ /$$$$$$  |$$$$$$$  |      $$ |  $$ |$$      \   "
	@echo -e ${CL_GRN}" $$$$$/     /    $$ |$$ |$$ |      $$ |  $$ |$$ |  $$ |      $$ |  $$ | $$$$$$  |  "
	@echo -e ${CL_GRN}" $$ |      /$$$$$$$ |$$ |$$ \_____ $$ \__$$ |$$ |  $$ |      $$ \__$$ |/  \__$$ |  "
	@echo -e ${CL_GRN}" $$ |      $$    $$ |$$ |$$       |$$    $$/ $$ |  $$ |      $$    $$/ $$    $$/   "
	@echo -e ${CL_GRN}" $$/        $$$$$$$/ $$/  $$$$$$$/  $$$$$$/  $$/   $$/        $$$$$$/   $$$$$$/    "
	@echo -e ""
	@echo -e "zip: "$(FALCON_TARGET_PACKAGE)
	@echo -e "md5: `cat $(FALCON_TARGET_PACKAGE).md5sum | cut -d ' ' -f 1`"
	@echo -e "size:`ls -lah $(FALCON_TARGET_PACKAGE) | cut -d ' ' -f 5`"
	@echo -e ""
	@echo -e ${CL_GRN}"============================="
	@echo -e ${CL_GRN}"      Fly Like A Falcon      "
	@echo -e ${CL_GRN}"        BY- TEAM FALCON	"
	@echo -e ${CL_GRN}"============================="
	@echo -e ""

bacon: fly
