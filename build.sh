#!/bin/bash

rm -rf docs
flutter build web
mv build/web docs