#!/bin/bash

watch -n1 'ceph osd df | sort -rk8'
