https://github.com/gunthercox/ChatterBot/tree/master/examples
http://chatterbot.readthedocs.io/

chatterbot.storage.MongoDatabaseAdapter
``` shell
pip install chatterbot
```
``` py
# -*- coding: utf-8 -*-
from chatterbot import ChatBot
import logging


# Uncomment the following line to enable verbose logging
# logging.basicConfig(level=logging.INFO)

# Create a new instance of a ChatBot
bot = ChatBot("Terminal",
    storage_adapter="chatterbot.storage.JsonFileStorageAdapter",
    # chatterbot.storage.MongoDatabaseAdapter
    logic_adapters=[
        "chatterbot.logic.MathematicalEvaluation",
        "chatterbot.logic.TimeLogicAdapter",
        "chatterbot.logic.BestMatch"
    ],
    input_adapter="chatterbot.input.TerminalAdapter",
    output_adapter="chatterbot.output.TerminalAdapter",
    database="../database.db"
)

print("Type something to begin...")

# The following loop will execute each time the user enters input
while True:
    try:
        # We pass None to this method because the parameter
        # is not used by the TerminalAdapter
        bot_input = bot.get_response(None)

    # Press ctrl-c or ctrl-d on the keyboard to exit
    except (KeyboardInterrupt, EOFError, SystemExit):
        break
```

chatterbot.train(
    "chatterbot.corpus.english"
)
chatterbot.train(
    "chatterbot.corpus.english.greetings",
    "chatterbot.corpus.english.conversations"
)
chatterbot.train(
    "./data/greetings_corpus/custom.corpus.json",
    "./data/my_corpus/"
)
chatbot.trainer.export_for_training('./my_export.json')


chatbot = ChatBot(
    'Bob the Bot',
    preprocessors=[
        'chatterbot.preprocessors.clean_whitespace'
    ]
)

ChatterBot’s preprocessors are simple functions that modify the input statement that a chat bot receives before the statement gets processed by the logic adaper.

chatterbot.preprocessors.clean_whitespace(chatbot, statement)
chatterbot.preprocessors.unescape_html(chatbot, statement)




logic_adapters=[
        {
            'import_path': 'chatterbot.logic.BestMatch'
        },
        {
            'import_path': 'chatterbot.logic.LowConfidenceAdapter',
            'threshold': 0.65,
            'default_response': 'I am sorry, but I do not understand.'
        }
    ],


    logic_adapters=[
            {
                'import_path': 'chatterbot.logic.BestMatch'
            },
            {
                'import_path': 'chatterbot.logic.SpecificResponseAdapter',
                'input_text': 'Help me!',
                'output_text': 'Ok, here is a link: http://chatterbot.rtfd.org/en/latest/quickstart.html'
            }
        ],
