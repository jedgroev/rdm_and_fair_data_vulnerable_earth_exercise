# Exercise: Evaluating Research Data Repositories

**Duration:** ~10 minutes exploration + 10 minutes group discussion  
**Level:** Bachelor

---

## The Exercise

You have been given two fictional data repositories based on the same soil
moisture study along an elevation gradient in the Pyrenees:

| Folder | Description |
|--------|-------------|
| `pyrenees_soil_moisture/` | A repository from a student project on soil moisture in the Pyrenees |
| `thesis_data/` | A repository from a different student working on the same project |

**Step 1 – Explore (5 minutes)**

Download and browse both repositories. Open a few files and look at the folder
structure, file names, and any documentation that is present.

**Step 2 – Discuss (5–10 minutes)**

As a group, work through the assessment questions below. Be specific: point to
actual files or folders when you explain your answer.

---

## Assessment Questions

### 1. Folder structure and file naming
- Is the folder structure logical? Can you tell at a glance what is in each folder?
- Are the file names meaningful? Would you know what a file contains without opening it?
- Are there files whose purpose is unclear (e.g. `data_v2`, `FINAL_copy`, `other_stuff`)?

### 2. Metadata and documentation
- Is there a README or similar overview file? Does it tell you:
  - Who collected the data, when, and where?
  - What the data represents?
  - How to reproduce the results?
- Are there metadata files describing the columns/variables in the data files?
- Is anything missing that would make the data hard to reuse?

### 3. Data files
- Can you open the data files without special software?
- Are column names clear and are units included?
- Are there unexplained values (e.g. `999`, empty cells, duplicate files)?
- Is it clear which file is the "correct" or final version of the data?

### 4. Scripts
- Are scripts present that show how the data was processed and analysed?
- Could you run the scripts on your own computer? What might stop you?
- Do the scripts reference files or paths that only exist on someone else's machine?

### 5. Reproducibility and reuse
- Given what is in the repository, could you reproduce the main result?
- Would you trust this data enough to build your own research on it? Why or why not?

---

## Key Takeaways

- A good repository is not about having the most files — it is about having
  the **right** files with **clear documentation**.
- Metadata (describing your data) is just as important as the data itself.
- Good practices should start **from the beginning** of a project, not at the end.
- Open, plain-text file formats (CSV, TXT, R scripts) are more reusable than
  proprietary formats (Excel, SPSS `.sav`).
