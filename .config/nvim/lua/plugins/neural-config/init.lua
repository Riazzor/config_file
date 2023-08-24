local status_ok, neural = pcall(require, 'neural')
if not status_ok then
    print('Something went wrong with neural')
    return
end

OPENAI_API_KEY = vim.env.OPENAI_API_KEY
if not OPENAI_API_KEY then
    print('The API key for openai is mandatory')
    return
end


OPENAI_API_KEY = vim.env.OPENAI_API_KEY
neural.setup({
    ui = {
        animated_sign_enabled = true,
        prompt_enabled = true,
        prompt_icon = '🗲',
    },
    source = {
        openai = {
            api_key = OPENAI_API_KEY,
        },
    }
})
