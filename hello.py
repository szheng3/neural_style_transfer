import click
from transformers import pipeline

@click.command()
@click.option('--models', default='openai/whisper-base', help='whisper models')
@click.option('--path', prompt='audio file path:',
              help='audio file path')
def audioToText(models, path):
    """Simple program that greets NAME for a total of COUNT times."""
    whisper = pipeline('automatic-speech-recognition', model=models)
    text = whisper(path)
    click.echo(text['text'])

if __name__ == '__main__':
    audioToText()