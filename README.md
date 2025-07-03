    # для отключения кулеров добавить в крон
    */1 * * * * echo level 0 > /proc/acpi/ibm/fan 
    */1 * * * * cpupower frequency-set -u 1500Mhz


    # game mode
    echo level 7 > /proc/acpi/ibm/fan 
    cpupower frequency-set -u 4500Mhz
