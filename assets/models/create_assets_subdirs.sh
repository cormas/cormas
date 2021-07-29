#!/bin/sh

dirs=(animations diagrams doc dumps images inputs maps old_versions outputs video)

for d in "${dirs[@]}"; do
	mkdir "$d"
	touch "$d"/.empty
done
