#!/bin/bash
# Default acpi script that takes an entry for all actions

# button/mute          / MUTE  / 00000080
# button/volumedown    / VOLDN / 00000080
# button/volumeup      / VOLUP / 00000080
# video/brightnessdown / BRTDN / 00000087
# video/brightnessup   / BRTUP / 00000086
# video/switchmode     / VMOD  / 00000080
# ibm/hotkey           / LEN0268:00 / 00000080
# ibm/hotkey           / LEN0268:00 / 00000080

case "$1" in
    button/power)
        case "$2" in
            PBTN|PWRF) logger 'ACPI: PowerButton pressed' ;;
            *) logger "ACPI group/action/event undefined: $1 / $2 / $3 / $4" ;;
        esac ;;

    video/brightnessdown)
        case "$2" in
            BRTDN) light -U 2 ;;
        esac ;;

    video/brightnessup)
        case "$2" in
            BRTUP) light -A 2 ;;
        esac ;;

    button/sleep)
        case "$2" in
            SLPB|SBTN)
                getXuser xset dpms force off
                logger 'ACPI: SleepButton pressed' ;;

            *) logger "ACPI: group/action/event undefined: $1 / $2 / $3 / $4" ;;
        esac ;;

    ac_adapter)
        case "$2" in
            AC|ACAD|ADP0)
                case "$4" in
                    00000000) logger 'ACPI: AC unplugged' ;;
                    00000001) logger 'ACPI: AC plugged' ;;
                esac ;;

            *) logger "ACPI group/action/event undefined: $1 / $2 / $3 / $4" ;;
        esac ;;

    button/lid)
        case "$3" in
            close)
                getXuser xset dpms force off
                logger 'ACPI: LID closed' ;;
            open)
                getXuser xset dpms force off
                logger 'ACPI: LID opened' ;;

            *) logger "ACPI button/lid: action/event undefined: $3 / $4" ;;
        esac ;;

    ibm/hotkey)
        case $3 in
            LENO268:00) logger "ACPI group/action/event undefined: $1 / $2 / $3 / $4" ;;

            *) logger "ACPI group/action/event undefined: $1 / $2 / $3 / $4" ;;
        esac ;;

    thermal_zone)
        case $3 in
            LNXTHERM:00) logger "ACPI group/action/event undefined: $1 / $2 / $3 / $4" ;;

            *) logger "ACPI group/action/event undefined: $1 / $2 / $3 / $4" ;;
        esac ;;

    *) logger "ACPI group/action/event undefined: $1 / $2 / $3 / $4" ;;
esac

# vim:set ts=4 sw=4 ft=sh et:
