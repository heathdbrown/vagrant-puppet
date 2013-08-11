#!/bin/bash
(cat << "END"
192.168.50.4    puppetmaster    puppetmaster.example.com
192.168.50.5    puppetagent     puppetagent.example.com
END
) >> /etc/hosts
