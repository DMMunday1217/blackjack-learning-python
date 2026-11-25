# Blackjack: Learning Python

A practice project for learning Python by building a game of blackjack, one small step at a time.

## Setup

You only need to do this once.

**1. Install uv.** [uv](https://docs.astral.sh/uv/) installs the right version of Python and the project's tools for you:

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

Close the terminal and open a new one so it picks up `uv`.

**2. Download the project:**

```bash
git clone https://github.com/DMMunday1217/blackjack-learning-python.git
cd blackjack-learning-python
```

**3. Run the setup script:**

```bash
./scripts/setup.sh
```

If it says git doesn't know who you are, run the two `git config` commands it prints, then run setup again.

**4. Check that it works:**

```bash
./scripts/run.sh     # should print "Welcome to Blackjack!"
./scripts/test.sh    # should show 1 passed
```

You're ready to start on the [roadmap](#roadmap).

<details>
<summary>Can't use uv? Use plain Python 3.10+ instead</summary>

The helper scripts need uv, so you'll run commands yourself:

```bash
python3 -m venv .venv
source .venv/bin/activate    # run this every time you open a new terminal
pip install pytest
python main.py               # play the game
pytest                       # run the tests
```

</details>

## Helper scripts

Shortcuts for everyday tasks. Run them from the project folder:

| Command | What it does |
| --- | --- |
| `./scripts/setup.sh` | First-time setup (run once after cloning) |
| `./scripts/run.sh` | Play the game |
| `./scripts/test.sh` | Run the tests (`./scripts/test.sh -k hand` runs just the matching ones) |
| `./scripts/status.sh` | See what you've changed and your recent commits |
| `./scripts/commit.sh "message"` | Run the tests, then save your work as a commit |
| `./scripts/push.sh` | Upload your commits to GitHub |
| `./scripts/pull.sh` | Download the latest changes from GitHub |
| `./scripts/undo.sh <file>` | Throw away uncommitted changes to one file (asks first) |

A typical loop: write some code → `run.sh` → `test.sh` → `commit.sh "what I did"` → `push.sh`.

## Branches and pull requests

Instead of putting changes straight onto `main`, do each piece of work on its own **branch** and open a **pull request (PR)**. A PR lets someone review your code before it's merged into `main`. Each roadmap step makes a good PR.

### 1. Start from the latest main

Commit or undo any changes you have first (`./scripts/status.sh` shows them), then:

```bash
git switch main
git pull
```

### 2. Create a branch

Pick a short name with dashes instead of spaces, e.g. `card-class` or `hand-value`:

```bash
git switch -c card-class
```

`-c` means "create". You're now on the new branch, and anything you commit goes here instead of `main`. To check which branch you're on, run `git branch` (the current one has a `*` next to it).

### 3. Write code and commit

Work as normal, committing as often as you like:

```bash
./scripts/run.sh
./scripts/test.sh
./scripts/commit.sh "Add a Card class"
```

### 4. Push the branch to GitHub

```bash
./scripts/push.sh
```

This uploads your branch (the same as `git push -u origin card-class`). The first time, git prints a link like `https://github.com/.../pull/new/card-class`.

### 5. Open the pull request

1. Open that link, or go to the repo on GitHub and click the yellow **Compare & pull request** banner.
2. Make sure it says **base: main** ← **compare: card-class**.
3. Give it a title saying what it does (e.g. "Add a Card class") and, optionally, a description of anything the reviewer should know.
4. Click **Create pull request**.

### 6. Respond to review

If you get feedback, make the changes on the same branch, then commit and push again. The PR updates by itself, so there's no need to open a new one.

### 7. After it's merged

Go back to `main`, get the merged code, and delete your old branch:

```bash
git switch main
git pull
git branch -d card-class
```

Then start again from step 2 for the next piece of work.

## Project layout

```
main.py         <- start the game from here
blackjack/      <- your game code goes in this folder
tests/          <- tests that check your code works
scripts/        <- helper scripts (see above)
```

## Roadmap

Work through these in order. Each one should leave you with something that runs.

- [ ] **1. Cards** — Represent a single card (rank and suit) and print it, e.g. `K♠`.
- [ ] **2. Deck** — Build a 52-card deck, shuffle it, and deal cards from it.
- [ ] **3. Hand value** — Add up a hand's score. Face cards are 10; aces are 1 or 11.
- [ ] **4. Player turn** — Ask the player to hit or stand until they stand or bust.
- [ ] **5. Dealer turn** — The dealer hits until reaching 17 or more.
- [ ] **6. Winner** — Compare hands and announce who won (including blackjack and ties).
- [ ] **7. Play again** — Loop so you can play several rounds.
- [ ] **8. Betting** — Give the player chips and let them bet each round.
- [ ] **Stretch goals** — Double down, splitting pairs, multiple decks, a nicer display.

Tip: write a test in `tests/` for each piece (especially hand value — aces are tricky!).
