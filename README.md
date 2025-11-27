<img width="606" height="469" alt="image" src="https://github.com/user-attachments/assets/ca073e77-61b3-43a5-84e3-330670fae3f5" /># Learning-and-Estimation-of-dynamical-systems-exam-project

## Technology
* MATLAB

## Description
The project was divided into two main tasks: the first involved estimating and visualizing an unknown linear model,
while the second focused on training a classifier and validating it on a separate test set.

## Theoretical Background
This project applies fundamental concepts from the *Learning and Estimation of Dynamical Systems* course, focusing on statistical learning and system identification. 
The work is divided into two main theoretical areas:
1.  **System Identification (Estimation):** Identifying an unknown AutoRegressive (AR) model from noisy data.
2.  **Pattern Recognition (Classification):** Developing a probabilistic classifier to distinguish between 5 classes in a 2D feature space.

---

## Part 1: Estimation (AR Model)

### Goal
To estimate the parameters and the model order of an unknown stochastic process using recursive algorithms.

### Methodology
* **Model Structure:** AutoRegressive (AR) model ($y(t) = \varphi(t)^T \theta + e(t)$).
* **Algorithm:** **Recursive Least Squares (RLS-III)** using the Matrix Inversion Lemma to minimize computational cost.
* **Model Order Selection:** Implemented the **Minimum Description Length (MDL)** criterion to balance model accuracy and complexity.
* **Validation:** Performed a **Whiteness Test** on the residuals ($\varepsilon(k)$) to verify that they behave as white noise (Gaussian check + Anderson test).

### Results
* **Optimal Order:** The MDL criterion identified the true model order as **p = 6**.
  <img width="606" height="469" alt="Screenshot 2025-11-27 110900" src="https://github.com/user-attachments/assets/a28c4e69-ce3d-4d31-85b4-9575a8ca667c" />
* **Comparison:** The RLS parameters converged to the batch Least Squares solution, confirming the correctness of the recursive implementation.
  <img width="630" height="474" alt="Screenshot 2025-11-27 111003" src="https://github.com/user-attachments/assets/49a07e12-4fda-4919-a708-feffbcecbf0f" />
* **Validation:** The model passed the whiteness test, confirming the residuals are uncorrelated.
  <img width="644" height="468" alt="Screenshot 2025-11-27 111035" src="https://github.com/user-attachments/assets/e7dc34e9-699d-46bc-a911-c9b74509d0fd" />

---

## Part 2: Classification (LDA)

### Goal
To classify a dataset with a 2D feature space into 5 distinct classes using a probabilistic approach.

### Methodology
* **Algorithm:** **Linear Discriminant Analysis (LDA)**.
* **Assumptions:** The classes are assumed to have Gaussian densities with different means ($\mu_k$) but a common covariance matrix ($\Sigma$).
* **Decision Rule:** Based on the **Softmax Function** to compute posterior probabilities and assign inputs to the class with the highest probability.

### Results
* **Training Error:** ~0.43%
* **Test Error:** ~0.40%
* The LDA successfully created linear decision boundaries that separated the 5 classes with high accuracy, proving to be an efficient linear classifier for this dataset.
  <img width="583" height="475" alt="Screenshot 2025-11-27 111233" src="https://github.com/user-attachments/assets/cf4f930e-39cc-489b-98a6-57f6cc8c9cfa" />
  <img width="614" height="473" alt="Screenshot 2025-11-27 111252" src="https://github.com/user-attachments/assets/3a70b4e0-4f1b-43e3-a608-482ced961f0a" />



---

## How to run
1.  Clone the repository.
2.  Add the `Functions` folder and subfolders to the MATLAB path.
3.  Run the `Binci_Alessandro.mlx` script.
4.  The script will generate plots for:
    * Signal Autocorrelation.
    * Cost Function (J) and MDL trends.
    * Parameter convergence.
    * Residual analysis.
    * Classification boundaries (Training vs Test sets).
