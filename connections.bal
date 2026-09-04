import ballerinax/ai.openai;

final openai:ModelProvider openaiModelprovider = check new (string `${openAiKey}`, "gpt-4o");
