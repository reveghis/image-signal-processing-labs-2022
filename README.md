# Image and signal processing labs (TAV)

> Practical assignments completed at **ENSEEIHT** (2SN MM) in 2022  
> Language: **MATLAB**

This repository contains 9 lab assignments covering key topics in statistical regression, image segmentation, image restoration, spectral analysis, and medical imaging reconstruction.

---

## Table of Contents

- [TP1 — Bézier Curve Regression](#tp1--bézier-curve-regression)
- [TP2 — Regularization and Flame Modelling](#tp2--regularization-and-flame-modelling)
- [TP3 — Ellipse Estimation and EM Algorithm](#tp3--ellipse-estimation-and-em-algorithm)
- [TP4 — Image Segmentation by Energy Minimization and Simulated Annealing](#tp4--image-segmentation-by-energy-minimization-and-simulated-annealing)
- [TP5 — Object Detection: Greedy Search and Birth-Death Point Processes](#tp5--object-detection-greedy-search-and-birth-death-point-processes)
- [TP6 — Image Restoration](#tp6--image-restoration)
- [TP7 — Photo Compositing and Active Contours](#tp7--photo-compositing-and-active-contours)
- [TP8 — Spectral Decomposition and Structure-Texture Separation](#tp8--spectral-decomposition-and-structure-texture-separation)
- [TP9 — Tomographic Reconstruction](#tp9--tomographic-reconstruction)
- [Requirements](#requirements)

---

## TP1 — Bézier Curve Regression

**Topic:** Supervised learning, least squares, model selection.

A Bézier curve of degree `d` is fitted to noisy data. The lab explores how to choose model complexity to avoid overfitting.

| File | Description |
|------|-------------|
| `exercice_1.m` | Parameter estimation via **least squares** and curve plotting |
| `exercice_2.m` | **Training error** as a function of degree `d` |
| `exercice_3.m` | Comparison of training error vs **generalization error**; estimation of `d` and `σ` |
| `exercice_4.m` | **Leave-one-out cross-validation** to estimate `d` and `σ` |

**Implemented functions:** `moindres_carres.m`, `bezier.m`, `bezier_bruitee.m`, `erreur_apprentissage.m`, `erreur_generalisation.m`, `calcul_VC.m`, `estimation_d_sigma.m`, `estimation_d_sigma_bis.m`

---

## TP2 — Regularization and Flame Modelling

**Topic:** Tikhonov regularization, cross-validation, parametric shape modelling.

Ridge regularization is introduced to control model complexity, then applied to modelling and simulating candle flame silhouettes.

| File | Description |
|------|-------------|
| `exercice_1.m` | **Ridge regression** (truncated least squares) with hyperparameter λ |
| `exercice_2.m` | Selection of optimal λ via **leave-one-out cross-validation** |
| `exercice_3.m` | Flame silhouette modelling with **two coupled Bézier curves** |
| `exercice_4.m` | **Simulation** of new flame shapes by random sampling from estimated normal distributions |
| `exercice_5.m` | Optimized (fast) cross-validation computation |

**Implemented functions:** `moindres_carres_ecretes.m`, `moindres_carres_bis.m`, `calcul_VC_bis.m`, `calcul_VC_ter.m`, `estimation_lambda_sigma.m`, `estimation_lois_n.m`, `simulation.m`

---

## TP3 — Ellipse Estimation and EM Algorithm

**Topic:** Maximum likelihood, nonlinear least squares, mixture models, EM algorithm.

This lab estimates the shape and position of ellipses from noisy data, comparing different estimation approaches and extending to two-ellipse mixtures using the EM algorithm.

| File | Description |
|------|-------------|
| `exercice_1.m` | Ellipse estimation via **maximum likelihood** (random search) |
| `exercice_2.m` | Estimation via **least squares**; comparison with ML |
| `exercice_3.m` | **Pair of ellipses** estimation (ML + LS); data partitioning into two classes |
| `exercice_4.m` | Iterative refinement via **EM algorithm** (weighted least squares) |

**Implemented functions:** `max_vraisemblance.m`, `max_vraisemblance_2.m`, `moindres_carres.m`, `moindres_carres_ponderes.m`, `conversion.m`, `points_ellipse.m`, `probabilites.m`, `probabilites_EM.m`, `calcul_score.m`, `calcul_score_2.m`, `calcul_r.m`

---

## TP4 — Image Segmentation by Energy Minimization and Simulated Annealing

**Topic:** Bayesian energy minimization, spatial regularization (Potts model), simulated annealing, supervised and unsupervised segmentation.

Image segmentation is formulated as an energy minimization problem combining a data fidelity term (likelihood) and a spatial regularization term that penalizes neighboring pixels with different labels. This energy is minimized by simulated annealing.

| File | Description |
|------|-------------|
| `exercice_1.m` | **Supervised** segmentation (grayscale): ML initialization then simulated annealing |
| `exercice_2.m` | **Unsupervised** segmentation: class parameters estimated without ground truth |
| `exercice_3.m` | Extension to **RGB color images** (microscopy cell image) *(optional)* |

**Implemented functions:** `estimation.m`, `estimation_non_super.m`, `attache_donnees.m`, `regularisation.m`, `recuit_simule.m`

---

## TP5 — Object Detection: Greedy Search and Birth-Death Point Processes

**Topic:** Greedy optimization, Markov Random Field energy, birth-death point processes, energy minimization.

Circular disks are placed over a flamingo colony image to localize individual birds. The approach evolves from a simple greedy search to a Markov-based energy model, and finally to a full probabilistic birth-death point process with a variable number of objects.

| File | Description |
|------|-------------|
| `exercice_0.m` | Basic **greedy search**: 50 disks placed independently to maximize local gray level *(provided)* |
| `exercice_1.m` | **Markov Random Field** detection: greedy energy minimization penalizing overlapping disks |
| `exercice_2.m` | **Birth-death process** with simulated annealing: variable number of disks, energy-based acceptance, temperature cooling |

**Implemented functions:** `calcul_I_moyen.m`, `regularistation.m`, `regularisation_bis.m`

---

## TP6 — Image Restoration

**Topic:** Variational denoising (Tikhonov, total variation), TV-based inpainting, patch-based inpainting.

This lab addresses the restoration of degraded images (noise, missing regions) using variational methods and patch-based texture synthesis.

| File | Description |
|------|-------------|
| `exercice_0.m` | Denoising with the **Tikhonov model** (direct sparse linear system solve) *(provided)* |
| `exercice_1.m` | Denoising via **total variation** — iterative fixed-point algorithm (grayscale) |
| `exercice_1_bis.m` | TV denoising extended to **color images** (processed channel by channel) |
| `exercice_2.m` | **TV-based inpainting**: restores a masked region using the TV energy model with a predefined binary mask |
| `exercice_2_bis.m` | **TV-based inpainting** with automatic domain detection by **color segmentation** |
| `exercice_3.m` | **Inpainting** by patch matching — fixed restoration domain (predefined mask) *(optional)* |
| `exercice_3_bis.m` | **Inpainting** by patch matching — interactively selected domain (polygon tool) *(optional)* |

**Implemented functions:** `debruitage.m`, `inpainting.m`, `frontiere.m`

---

## TP7 — Photo Compositing and Active Contours

**Topic:** Image compositing, active contour models (snakes), external force fields, Gradient Vector Flow (GVF).

This lab covers two complementary topics: naive image compositing and deformable contour models for image segmentation.

| File | Description |
|------|-------------|
| `exercice_0.m` | **Naive photo compositing**: interactive polygon selection, copy-paste between images with automatic resizing |
| `exercice_1.m` | **External force field** computation: gradient of a Gaussian-smoothed image for snake initialization |
| `exercice_2.m` | **Active contour (snake)** evolution via gradient descent; convergence criterion; interactive control point placement |
| `exercice_3.m` | **Gradient Vector Flow (GVF)**: diffused force field enabling contours to reach concave regions |

**Implemented functions:** `collage_naif.m`, `matrice_A.m`, `iteration.m`

---

## TP8 — Spectral Decomposition and Structure-Texture Separation

**Topic:** 2D Fourier transform, frequency filtering, ROF model, TV-Hilbert decomposition.

This lab decomposes images into structural and textural components using both spectral manipulation and variational approaches.

| File | Description |
|------|-------------|
| `exercice_0.m` | **Spectrum manipulation demo**: interactive frequency band selection on a striped grid using `roipoly` *(provided)* |
| `exercice_1.m` | **Low-pass filtering** with a binary disk mask in the frequency domain |
| `exercice_1_bis.m` | **Soft low-pass filtering** with a weighted frequency response (Φ function) |
| `exercice_2.m` | **Structure-texture separation** via the ROF model (TV regularization, iterative fixed-point solver) |
| `exercice_3.m` | **Structure-texture separation** via the TV-Hilbert model (gradient descent) *(optional)* |

**Implemented functions:** `affichage.m`, `calcul_gradient.m`, `calcul_structure_2.m`, `calcul_structure_3.m`, `calcul_Phi.m`

---

## TP9 — Tomographic Reconstruction

**Topic:** Radon transform, sinogram, algebraic reconstruction, backprojection.

This lab implements methods to reconstruct a 2D image from its projections (sinogram), as used in medical CT scanners.

| File | Description |
|------|-------------|
| `exercice_1.m` | **Algebraic reconstruction** via the Kaczmarz iterative algorithm |
| `exercice_2.m` | **Backprojection** reconstruction from the sinogram (unfiltered) |


**Implemented functions:** `calcul_W.m`, `calcul_sinogramme.m`, `kaczmarz.m`, `retroprojection.m`

---

## Requirements

- **MATLAB** R2018b or later (with Image Processing Toolbox)
- Each lab is self-contained. Run `exercice_X.m` from within the corresponding TP folder.
