# Build Options
#   change to "no" to disable the options, or define them in the Makefile in
#   the appropriate keymap folder that will get included automatically
#

MOUSEKEY_ENABLE = no        # Mouse keys
EXTRAKEY_ENABLE = yes       # Audio control and System control
CONSOLE_ENABLE = yes        # Console for debug
COMMAND_ENABLE = no         # Commands for debug and configuration
NKRO_ENABLE = no            # Nkey Rollover - if this doesn't work, see here: https://github.com/tmk/tmk_keyboard/wiki/FAQ#nkro-doesnt-work
RGBLIGHT_ENABLE = yes       # Enable global lighting effects. Do not enable with RGB Matrix
RGBLIGHT_ANIMATIONS = yes   # LED animations
RGBLIGHT_SPLIT_ENABLE = no  # Split RGBLight Support
RGB_MATRIX_ENABLE = no      # Enable per-key coordinate based RGB effects. Do not enable with RGBlight
RGB_MATRIX_KEYPRESSES = no  # Enable reactive per-key effects.
RGBLIGHT_FULL_POWER = yes   # Allow maximum RGB brightness. Otherwise, limited to a safe level for a normal USB-A port
UNICODE_ENABLE = no         # Unicode
SWAP_HANDS_ENABLE = no      # Enable one-hand typing
ENCODER_ENABLE = yes        # Enable rotary encoder
OLED_ENABLE = no     # Enable the OLED Driver
IOS_DEVICE_ENABLE = no      # Limit max brightness to connect to IOS device (iPad,iPhone)

# Do not edit past here

ifeq ($(strip $(IOS_DEVICE_ENABLE)), yes)
    OPT_DEFS += -DIOS_DEVICE_ENABLE
else ifeq ($(strip $(RGBLIGHT_FULL_POWER)), yes)
    OPT_DEFS += -DRGBLIGHT_FULL_POWER
endif

ifeq ($(strip $(RGB_MATRIX_KEYPRESSES)), yes)
    OPT_DEFS += -DRGB_MATRIX_KEYPRESSES
endif

ifeq ($(strip $(RGBLIGHT_ANIMATIONS)), yes)
    OPT_DEFS += -DRGBLIGHT_ANIMATIONS
endif

ifeq ($(strip $(RGBLIGHT_SPLIT_ENABLE)), yes)
    OPT_DEFS += -DRGBLIGHT_SPLIT_ENABLE
endif

# Link time optimization, should save on firmware size
EXTRAFLAGS += -flto
