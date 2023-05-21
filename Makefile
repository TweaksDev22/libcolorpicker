export THEOS_PACKAGE_SCHEME=rootless
export TARGET = iphone:clang:12.4:12.0

THEOS_DEVICE_IP = 192.168.1.151

include $(THEOS)/makefiles/common.mk

LIBRARY_NAME = libcolorpicker

$(LIBRARY_NAME)_FILES = libcolorpicker.mm UIColor+PFColor.m PFColorPicker.m PFColorTransparentView.m PFColorViewController.xm PFColorCell.mm PFColorAlert.m PFColorAlertViewController.xm PFHaloHueView.m PFHaloKnobView.m PFColorLitePreviewView.m PFColorLiteSlider.m PFLiteColorCell.mm PFSimpleLiteColorCell.mm PFColorPickerWelcome.mm
$(LIBRARY_NAME)_FRAMEWORKS = UIKit CoreGraphics Foundation Social Accounts
$(LIBRARY_NAME)_PRIVATE_FRAMEWORKS = Preferences
$(LIBRARY_NAME)_LDFLAGS += -Wl,-segalign,4000
$(LIBRARY_NAME)_CFLAGS = -fobjc-arc -Wno-deprecated-declarations
PFColorAlert.m_CFLAGS = -fno-objc-arc
PFSimpleLiteColorCell.mm_CFLAGS = -fno-objc-arc
PFLiteColorCell.mm_CFLAGS = -fno-objc-arc

after-install::
	install.exec "killall -9 Preferences"

include $(THEOS_MAKE_PATH)/library.mk
