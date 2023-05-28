import click.testing
import pytest

from hello import audioToText


@pytest.fixture
def runner():
    return click.testing.CliRunner()

def test_hello(runner):
    result = runner.invoke(audioToText, ['--models', 'openai/whisper-base', '--path', 'audio.mp3'])
    assert result.exit_code == 0
    assert 'This time' in   result.output

def test_hello_prompt(runner):
    result = runner.invoke(audioToText, input='audio.mp3\n')
    assert result.exit_code == 0
    assert 'This time' in   result.output
