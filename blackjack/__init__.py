"""The blackjack package.

You don't need this folder yet! It's fine to write all your code in main.py
to start. Come back here once main.py starts feeling long or hard to find
things in.


What is this folder?
--------------------
A folder of Python files with an __init__.py inside it (this file) is called
a *package*. Each .py file inside it is a *module*. Modules let you split your
code into smaller files that each do one job, instead of one giant file.

This __init__.py file can stay empty (apart from this note). Its job is to
tell Python "this folder is a package, you can import from it."


How to move code out of main.py
-------------------------------
Say main.py has a function that adds up a hand's score:

    # main.py
    def hand_value(cards):
        ...

1. Make a new file in this folder, e.g. blackjack/hand.py, and move the
   function into it:

    # blackjack/hand.py
    def hand_value(cards):
        ...

2. At the top of main.py, import it:

    # main.py
    from blackjack.hand import hand_value

   Now you can call hand_value(...) in main.py exactly like before.

3. Run ./scripts/run.sh to check the game still works.


Ideas for how to split things up
--------------------------------
    blackjack/cards.py   - the Card and Deck code
    blackjack/hand.py    - scoring a hand (aces are 1 or 11!)
    blackjack/game.py    - the player and dealer turns, picking a winner

main.py then just starts the game, and most of the code lives here.


Bonus: modules make testing easier
----------------------------------
Tests in the tests/ folder can import your code the same way:

    # tests/test_hand.py
    from blackjack.hand import hand_value

    def test_two_kings_is_20():
        assert hand_value(["K", "K"]) == 20

Run them with ./scripts/test.sh.
"""
