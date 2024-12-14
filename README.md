# Health Bar System for RedM

## Overview

This is a lightweight and visually appealing health bar system for RedM. It displays health bars above players' heads, providing a clear and dynamic indication of their health status. The health bar adapts in real-time to changes in health levels, transitioning smoothly between colors.

## Features

- **Dynamic Health Bar:** Displays a health bar above nearby players' heads.
- **Color Interpolation:** The bar color transitions from green to red based on the player's health percentage.
- **Customizable Text Alignment:** Displays player names aligned with the health bar.
- **Optimized Rendering:** Only renders for players within a certain range and clear line of sight.

## Installation

1. **Download and Extract:**
   - Download the repository and extract it to your RedM resources folder.

2. **Add Resource to Server Config:**
   - Add the following line to your `server.cfg` file:
     ```plaintext
     ensure asfallen-hpbar
     ```

3. **Verify Dependencies:**
   - Ensure your server is running RedM with `lua54` enabled.

## Configuration

### Files Included

- **`fxmanifest.lua`:** Metadata and configuration for the resource.
- **`asfallen-hpbarClient.lua`:** Client-side logic for drawing the health bars.

### Modifiable Parameters

- **Distance Limit:** Adjust the rendering distance for the health bars.
  ```lua
  if distance < 20.0
  ```
  Modify `20.0` to your preferred distance in meters.

- **Health Bar Size:**
  ```lua
  local barWidth, barHeight = 0.05, 0.008
  ```
  Change these values to customize the health bar's width and height.

## Usage

1. **Start the Server:** Run your RedM server and ensure the resource is loaded without errors.
2. **Health Bar Display:** Health bars will automatically display above players within range and line of sight.

## Known Issues

- Health bars may not render properly in areas with extreme camera angles.
- Compatibility issues might arise with future RedM updates.

## Contribution

Feel free to open issues or submit pull requests to improve the system. Contributions are always welcome!



