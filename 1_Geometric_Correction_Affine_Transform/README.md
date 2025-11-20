Geometric Correction with Affine Transformation

This project is part of the Raster Algorithms module.
The objective is to geometrically correct an aerial raster image (“GSD-Ortofoto”) by aligning it with the SWEREF 99 TM coordinate system using an affine transformation.

Overview

The supplied orthophoto is not properly georeferenced.
To correct it, I used a set of Ground Control Points (GCPs), each containing:

Image coordinates (column, row)

Real-world coordinates (SWEREF 99 TM: x, y)

Using these paired points, I computed the six affine transformation parameters:

𝑋
′
=
𝑋
0
+
𝑚
𝑥
⋅
𝑋
+
𝛼
⋅
𝑌
𝑌
′
=
𝑌
0
+
𝑚
𝑦
⋅
𝑌
+
𝛽
⋅
𝑋
X
′
=X0+mx⋅X+α⋅Y
Y
′
=Y0+my⋅Y+β⋅X

These parameters allow us to map every pixel from the original orthophoto to its proper position in the target coordinate system.

Workflow
1. Load the data

Both the orthophoto (ortofoto.txt) and the GCP file (gcp.txt) were loaded using NumPy.

2. Compute affine parameters

I constructed matrix A (image coordinates) and vector B (SWEREF coordinates), then solved the linear system using:

numpy.linalg.lstsq()


This produces the six affine parameters:

X0

Y0

mx

my

α

β

3. Compute RMSE

To assess accuracy, I applied the transformation to all GCPs and calculated the Root Mean Square Error (RMSE):

RMSE = √( Σ (Δx² + Δy²) / N )


My resulting RMSE was: [your actual RMSE here] meters.

4. Define the target grid

An empty SWEREF 99 TM raster was created using the specified bounding box:

xmin = 731000

xmax = 733000

ymin = 7131200

ymax = 7132700

Resolution: 1 meter.

5. Resampling

For each pixel in the target grid, I transformed the coordinate backward into image space and assigned the corresponding value.

(If you used bilinear interpolation, specify it here; otherwise state that nearest neighbor was used as required.)

6. Visualization

Both the original and the geometrically corrected image were displayed using Matplotlib.

Files

affine_transform.py — main script containing the affine function and full workflow

original_vs_transformed.png — comparison of the original and corrected images

report.pdf — (optional) assignment report

How to run
python affine_transform.py


Requires:

Python 3

NumPy

Matplotlib
