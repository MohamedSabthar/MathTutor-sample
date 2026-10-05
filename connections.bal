import ballerinax/ai.anthropic;

final anthropic:ModelProvider openaiModelprovider = check new (string `${key}`, anthropic:CLAUDE_OPUS_4_5, serviceUrl = url);
