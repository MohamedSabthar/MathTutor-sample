import ballerina/ai;
import ballerina/http;
// import ballerina/log;
import ballerina/io;

listener ai:Listener chatAgentListener = new (listenOn = check new http:Listener(9090, timeout = 300));

service /math\-tutor on chatAgentListener {
    resource function post chat(@http:Payload ai:ChatReqMessage request) returns ai:ChatRespMessage|error {
        io:println("API KEY", key);
        io:println("Agent cid", ampAgentidClientId);
        string stringResult = check mathTutor.run(request.message, request.sessionId);
        return {message: stringResult};
    }
}
