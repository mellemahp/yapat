#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""/app/views.py
Description: Defines the primary application views for the application
Project: Python App Template
Author: Hunter Mellema
Date: 1/20/2020
"""
# === Start imports ===#
# third party imports
from bottle import jinja2_template, request, response
import json
# === End Imports ===#


def hello():
    return jinja2_template("hello.html")


def hiya():
    return jinja2_template("hiya.html")


def things(): 

    data = json.load(request.body)

    name = data['name']
    attribute = data['att']

    # return 200 Success
    response.content_type = 'application/json'
    return json.dumps({'name': name + " " + attribute})