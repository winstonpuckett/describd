module.exports = function (eleventyConfig) {
    eleventyConfig.addPassthroughCopy("src/sampleList.json");
    return {
        dir: {
            input: "src",
            output: "dist"
        }
    }
};