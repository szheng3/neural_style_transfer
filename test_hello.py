import click.testing
import pytest

from hello import hello


@pytest.fixture
def runner():
    return click.testing.CliRunner()

def test_hello(runner):
    result = runner.invoke(hello, ['--count', '3', '--name', 'Test'])
    assert result.exit_code == 0
    assert result.output == 'Hello Test!\n' * 3

def test_hello_prompt(runner):
    result = runner.invoke(hello, input='Test\n')
    assert result.exit_code == 0
    assert result.output == 'Your name: Test\nHello Test!\n'
