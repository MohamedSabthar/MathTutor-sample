import ballerinax/ai.anthropic;
import ballerina/io;

final anthropic:ModelProvider openaiModelprovider = check new (string `${key}`, anthropic:CLAUDE_OPUS_4_6, serviceUrl = url + "/v1");
final AiMcpbasetoolkit aiMcpbasetoolkit = check getTk();

function getTk() returns error|AiMcpbasetoolkit {
    AiMcpbasetoolkit|error tk = new (string `${mcpUrl}`, auth = {
        tokenUrl: ampAgentidTokenEndpoint,
        clientId: ampAgentidClientId,
        clientSecret: ampAgentidClientSecret,
        credentialBearer: "AUTH_HEADER_BEARER"
    });
    if tk is error {
        io:println(tk.toBalString());
    }
    return tk;
}