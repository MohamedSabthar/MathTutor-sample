import ballerina/ai;

final ai:Agent mathTutor = check new (
    systemPrompt = {
        role: string `Math Tutor`,
        instructions: string `You are a math tutor assistant.

RULES (MUST FOLLOW):

* You MUST use the provided mathematical tools (add, subtract, multiply, divide) for ALL calculations, even simple ones.
* You are NOT allowed to compute results mentally or inline.
* If a calculation is required and a tool is available, you MUST call the tool.
* If you do not call a tool when a calculation is required, the response is invalid.

Provide clear, step-by-step explanations. Include the final answer at the end.`
    }, model = openaiModelprovider, tools = [sum, multiply, divide, substract]
);

# Provide sum of two numbers
# + a - first number
# + b - second number
# + return - sum of two provided numbers
@ai:AgentTool
isolated function sum(float a, float b) returns float {
    return a + b;

}

# Provide multiplication of two numbers
# + a - first number
# + b - second number
# + return - provides multiplication of two numbers
@ai:AgentTool
isolated function multiply(float a, float b) returns float {
    return a * b;

}

# Divides the first number by second number
# + a - first number to be divided
# + b - second number
# + return - returns the division result or an error on failure
@ai:AgentTool
isolated function divide(float a, float b) returns float|error {
    if b == 0.0 {
        return error("division by zero is not allowed");
    }
    return a / b;
}

# Substract the second number from first number
# + a - first number
# + b - second number
# + return - result of the substraction
@ai:AgentTool
isolated function substract(float a, float b) returns float {
    return a - b;
}
