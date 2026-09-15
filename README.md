# Exercise: Evaluating Research Data Repositories

**Duration:** ~10 minutes exploration + 10 minutes group discussion  
**Level:** Bachelor

---

## Background

A research data repository is a structured collection of files that allows
others (and your future self) to understand, reproduce, and reuse your
research. A good repository follows the FAIR principles:

| Principle | What it means in practice |
|-----------|--------------------------|
| **F**indable | The repository has a clear description and uses standard file formats; ideally has a persistent identifier (DOI) |
| **A**ccessible | Files can be opened and read without special permissions or software |
| **I**nteroperable | Data is in open, machine-readable formats (e.g. CSV, not Excel) |
| **R**eusable | Documentation is complete enough that someone else could reuse the data |

The most important question to ask yourself when building a repository is:

> *"If a stranger downloaded this folder, could they understand what is here,
> reproduce the results, and trust the data enough to reuse it?"*

---

## The Dataset

Both repositories in this exercise use the same real, publicly available dataset:

> Fairbairn, A.J., Katholnigg, S., Leichtle, T., Merkens, L., Schroll, L.,
> Weisser, W.W. & Meyer, S.T. (2025) *Acoustic bird diversity and community
> composition in relation to urban greenness in Munich, Germany* [Dataset].
> Zenodo. https://doi.org/10.5281/zenodo.17991471

The dataset contains bird diversity measurements from 86 passive acoustic
monitoring sites across Munich, Germany, alongside vegetation greenness
measures (NDVI, vegetation volume) at each site.

---

## The Exercise

You have been given two repositories that both use this dataset:

| Folder | Description |
|--------|-------------|
| `munich_birds/` | A repository from a student project analysing the data |
| `thesis_data/`  | A repository from a different student working on the same data |

**Step 1 – Explore (5 minutes)**

Browse both repositories. Open a few files and look at the folder structure,
file names, and any documentation present. You can also look up the original
dataset on Zenodo using the DOI above.

**Step 2 – Discuss (5–10 minutes)**

As a group, work through the assessment questions below. Be specific: point to
actual files or folders when you explain your answer.

---

## Assessment Questions

### 1. Folder structure and file naming
- Is the folder structure logical? Can you tell at a glance what is in each folder?
- Are the file names meaningful? Would you know what a file contains without opening it?
- Are there files whose purpose is unclear (e.g. `_v2`, `_FINAL`, `_copy`, `other_stuff`)?

### 2. Metadata and documentation
- Is there a README or similar overview file? Does it tell you:
  - Who created the repository, when, and what it is about?
  - Where the data came from (source, DOI, license)?
  - How to reproduce the results?
- Are the data files described clearly (column names, units, what values mean)?
- Is anything missing that would make the data hard to reuse?

### 3. Data files
- Can you open the data files without special software?
- Is it clear where the data came from and whether it is allowed to reuse it?
- Is there a reference back to the original dataset and its DOI?
- Is it clear which file is the correct or final version?

### 4. Scripts
- Are scripts present that show how the data was processed and analysed?
- Could you run the scripts on your own computer? What might stop you?
- Do the scripts reference files or paths that only exist on someone else's machine?

### 5. Findability and FAIR
- Look up the DOI https://doi.org/10.5281/zenodo.17991471 — what does the
  original Zenodo repository look like compared to these two repositories?
- Which repository makes it easiest to find, understand, and reuse the data?
- What would happen if the original Zenodo link changed or disappeared — which
  repository would still let you understand what data was used?

---

## After the Discussion

Together, draft a short list of **5 criteria** you would use to assess any
research data repository. For each criterion, write one sentence describing
what "good" looks like.

Example format:

| # | Criterion | What "good" looks like |
|---|-----------|------------------------|
| 1 | README file | There is a README that describes the project, data source, license, and how to reproduce the results |
| 2 | ... | ... |

---

## Key Takeaways

- A good repository is not about having the most files — it is about having
  the **right** files with **clear documentation**.
- Referencing the original data source with a **DOI** is essential for
  attribution, reproducibility, and findability (the F and R in FAIR).
- Open, plain-text file formats (CSV, TXT, R scripts) are more reusable than
  proprietary formats (Excel, SPSS `.sav`).
- Good practices should start **from the beginning** of a project, not at the end.
