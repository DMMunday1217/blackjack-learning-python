from main import main


def test_main_runs(capsys):
    main()
    output = capsys.readouterr().out
    assert "Blackjack" in output
