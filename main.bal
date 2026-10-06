import ballerina/ai;
import ballerina/http;
import ballerina/log;

listener ai:Listener chatAgentListener = new (listenOn = check http:getDefaultListener());

service /math\-tutor on chatAgentListener {
    resource function post chat(@http:Payload ai:ChatReqMessage request) returns ai:ChatRespMessage|error {
        log:printDebug("API KEY", key = key);
        string stringResult = check mathTutor.run(request.message, request.sessionId);
        return {message: stringResult};
    }
}
