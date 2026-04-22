# Let's Learn AI Together

Welcome to the code repository for **Let's Learn AI Together!** — a hands-on tutorial (and possible book) designed to teach AI and machine learning concepts step by step.

## About

This repository contains scripts and data for building, training, and evaluating simple AI models using real-world movie rating data. Each script is explained in detail as part of the tutorial series.

## Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/ai-projects.git
cd ai-projects
```

### 2. Set Up Your Python Environment

We recommend using a virtual environment to keep dependencies isolated.

#### Using the provided script

- On **Linux/macOS**:

 ```bash
 bash scripts/env.sh
 ```

- On **Windows**:

 ```cmd
 scripts\env_win.bat
 ```

This will create and activate a virtual environment in the `venv/` folder.

#### Or manually

- On **Linux/macOS**:

 ```bash
 python3 -m venv venv
 source venv/bin/activate
 ```

- On **Windows**:

 ```cmd
 python -m venv venv
 venv\Scripts\activate.bat
 ```

### 3. Install Dependencies

With your virtual environment activated, install the required packages:

```bash
pip install -r requirements.txt
```

### 4. Run the Example Script

Try running the main AI script:

```bash
python movie_ai.py
```

You should see output indicating data loading, feature extraction, training, and evaluation.

## Data

The dataset used in this project is the [MovieLens](https://grouplens.org/datasets/movielens/) ml-latest-small dataset.

**To download the dataset:**

- On **Linux/macOS**:

 ```bash
 bash scripts/download_movielens.sh
 ```

 This script will check for required tools (wget, unzip) and prompt to install them using your system's package manager:

- On Linux (Debian/Ubuntu): uses `apt-get`
- On macOS: uses `brew` (Homebrew)

 Add `-y` to auto-confirm package installs:

 ```bash
 bash scripts/download_movielens.sh -y
 ```

- On **Windows**:

 ```cmd
 scripts\download_movielens_win.bat
 ```

This will automatically download and extract the data into the `ml-latest-small/` folder.

See `ml-latest-small/README.txt` for details and license.

## Project Structure

- `movie_ai.py` — Main AI script for movie ratings prediction
- `explore.py`, `hello.py` — Additional scripts for experimentation
- `ml-latest-small/` — MovieLens dataset (CSV files)
- `requirements.txt` — Python dependencies
- `scripts/env.sh` — Environment setup script

## License and Attribution

- The MovieLens dataset is provided by GroupLens and subject to their license (see `ml-latest-small/README.txt`).
- All tutorial code is © 2026 Alejandro G. Carlstein R. M.
- This code is released under the MIT License (see LICENSE).
