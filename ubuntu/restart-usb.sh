for port in $(lspci | grep USB | cut -d' ' -f1); do
    echo -n "0000:${port}"| sudo tee /sys/bus/pci/drivers/xhci_hcd/unbind;
    sleep 5;
    echo -n "0000:${port}" | sudo tee /sys/bus/pci/drivers/xhci_hcd/bind;
    sleep 5;
done
