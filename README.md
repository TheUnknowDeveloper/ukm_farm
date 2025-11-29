# FiveM ESX Farming and Moneywash System

A modular farming and economy script for ESX based FiveM servers.  
This script adds farming locations, item processing, NPC traders, money washing, blips, and NativeUI menus.  
Perfect for servers that want legal or illegal economy routes.

---

## 1. Features

### Farming System
- Multiple customizable farming zones
- Animations and progress bar using mythic_progbar
- Server side item handling via ESX inventory
- Configurable item amount and time per farming action

### Selling System
- NPC traders with NativeUI menus
- Random sale prices within defined ranges
- Checks if player has enough items before selling
- Clean NPC spawning with frozen and invincible peds

### Item Processing
- Optional processing menu (expandable)
- Example: Turn oranges into orange juice

### Money Washing System
- Location based moneywash spot
- Exchange rate: 1 to 2 (example)
- Amount input via NativeUI dialog

### User Interface
- Blips for all harvest locations and shops
- NativeUI menus for interaction
- Help notifications and markers
- Fully ESX compatible

---

## 2. Requirements

You must have the following resources installed:

- ESX Legacy or ESX 1.8
- NativeUILua Reloaded
- mythic_progbar
- mysql async or oxmysql (depending on your server)
- FiveM server supporting fx_version "cerulean"

---

## 3. Installation

1. Download the script and place the folder inside:
