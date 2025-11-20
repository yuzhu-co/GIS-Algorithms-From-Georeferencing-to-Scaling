# Geometric Correction with Affine Transformation

This project is part of the Raster Algorithms module. The objective is to geometrically correct an aerial raster image ("GSD-Ortofoto") by aligning it with the SWEREF 99 TM coordinate system using an affine transformation.

## Overview

The supplied orthophoto is not properly georeferenced. To correct it, I used a set of Ground Control Points (GCPs), each containing:

- Image coordinates (column, row)
- Real-world coordinates (SWEREF 99 TM: x, y)

Using these paired points, I computed the six affine transformation parameters:
X' = X0 + mx * X + α * Y
Y' = Y0 + my * Y + β * X

These parameters allow us to map every pixel from the original orthophoto to its proper position in the target coordinate system.

## Workflow

### 1. Load the data
Both the orthophoto (`ortofoto.txt`) and the GCP file (`gcp.txt`) were loaded using NumPy.

### 2. Compute affine parameters
I constructed matrix A (image coordinates) and vector B (SWEREF coordinates), then solved the linear system using:
```python
numpy.linalg.lstsq()

