import ballerina/ai;
import ballerina/http;
import ballerina/log;
import ballerina/io;

listener ai:Listener chatAgentListener = new (listenOn = check http:getDefaultListener());

service /math\-tutor on chatAgentListener {
    resource function post chat(@http:Payload ai:ChatReqMessage request) returns ai:ChatRespMessage|error {
        io:println("API KEY", key);
        io:println("Agent cid", ampAgentidClientId);
        string stringResult = check mathTutor.run(request.message, request.sessionId);
        return {message: stringResult};
    }
}
