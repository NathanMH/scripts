#include QMK_KEYBOARD_H
#include "debug.h"
#include "action_layer.h"

#define BASE 0 // default layer

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
/* Keymap 0: Basic layer
 *
 * ,--------------------------------------------------.           ,--------------------------------------------------.
 * | Esc    | TODO |   1  |   2  |   3  |   4  |  5   |           |      |   6  |   7  |   8  |   9  |   0  |  TODO  |
 * |--------+------+------+------+------+-------------|           |------+------+------+------+------+------+--------|
 * | Tab    |   Q  |   W  |   F  |   P  |   G  |  [   |           |  ]   |   J  |   L  |   U  |   Y  |   ;  |   \    |
 * |--------+------+------+------+------+------|      |           |      |------+------+------+------+------+--------|
 * | Ctrl   |   A  |   R  |   S  |   T  |   D  |------|           |------|   H  |   N  |   E  |   I  |   O  |   '    |
 * |--------+------+------+------+------+------|  =   |           |  -   |------+------+------+------+------+--------|
 * | LShift |   Z  |   X  |   C  |   V  |   B  |      |           |      |   K  |   M  |   ,  |   .  |   /  | RShift |
 * `--------+------+------+------+------+-------------'           `-------------+------+------+------+------+--------'
 *   |Grv/L1|  '"  |AltShf| Left | ALT  |                                       |  ALT | LEFT | DOWN |  UP  | RIGHT  |
 *   `----------------------------------'                                       `----------------------------------'
 *                                        ,-------------.       ,-------------.
 *                                        | Vol+ | Vol- |       | Alt  |Ctrl/Esc|
 *                                 ,------|------|------|       |------+--------+------.
 *                                 |      |      | Home |       | PgUp |        |      |
 *                                 | Bkspc| Del  |------|       |------|  Tab   |Enter |
 *                                 |      |      | End  |       | PgDn |        |      |
 *                                 `--------------------'       `----------------------'
 */
// If it accepts an argument (i.e, is a function), it doesn't need KC_.
// Otherwise, it needs KC_*
[BASE] = LAYOUT_ergodox(  // layer 0 : default
        // left hand
        KC_ESC,         TODO,         KC_2,   KC_3,   KC_4,   KC_5,   TODO,
        KC_TAB,         KC_Q,         KC_W,   KC_F,   KC_P,   KC_G,   KC_LBRACKET,
        KC_LCTL,        KC_A,         KC_R,   KC_S,   KC_T,   KC_D,
        KC_LSFT,        KC_Z,         KC_X,   KC_C,   KC_V,   KC_B,   KC_EQUAL,
           TODO,    	TODO,	      TODO,   TODO,   KC_LALT,

                                              ALT_T(KC_VOLU),       ALT_T(KC_VOLD),
                                                                    KC_HOME,
                                              KC_BSPC, KC_DELETE,   KC_LGUI,

        // right hand
        TODO,        KC_6,   KC_7,   KC_8,   KC_9,   KC_0,     TODO,
        KC_RBRACKET, KC_J,   KC_L,   KC_U,   KC_Y,   KC_SCLN,  KC_BSLS,
                     KC_H,   KC_N,   KC_E,   KC_I,   KC_O,     KC_QUOT,
        KC_MINS,     KC_K,   KC_M,   KC_COMM,KC_DOT, KC_SLSH,  KC_RSFT,
                             KC_RALT,KC_LEFT,KC_DOWN,KC_UP,KC_RIGHT,

             ALT_T(KC_MNXT),        ALT_T(KC_MPRV),
             KC_PGUP,
             KC_PGDN,KC_TAB, KC_ENT
    ),
};

// Runs just one time when the keyboard initializes.
void matrix_init_user(void) {

};
