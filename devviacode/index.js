module.exports = async function (context, req) {
    context.log('JavaScript HTTP trigger function processed a request.');

    const name = (req.query.name || (req.body && req.body.name));
    const responseMessage = name
        ? "Hello, " + name + ". This HTTP triggered function executed successfully."
        : "This function devnew code-3";

    context.res = {
        // status: 200, /* Defaults to 200 */
        body: responseMessage
    };
}
