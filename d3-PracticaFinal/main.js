const width = 900
const height = 600
const margin = {top:10, bottom:40, left:40, right:10}

const svg = d3.select("div#chart").append("svg").attr("width", width).attr("height", height)
const elementGroup = svg.append("g").attr("id", "elementGroup").attr("transform", `translate(${margin.left}, ${margin.top})`)
const axisGroup = svg.append("g").attr("id", "aAxisGroup")
const xAxisGroup = axisGroup.append("g").attr("id", "xAxisGroup").attr("transform", `translate (${margin.left}, ${height - margin.bottom})`)
const yAxisGroup = axisGroup.append("g").attr("id", "yAxisGroup").attr("transform", `translate (${margin.left}, ${margin.top})`)

const x = d3.scaleBand().range([0, width - margin.left - margin.right]).padding(0.1)
const y = d3.scaleLinear().range([height - margin.top  - margin.bottom, 0])

const xAxis = d3.axisBottom().scale(x)
const yAxis = d3.axisLeft().scale(y)

d3.csv("WorldCup.csv").then(data => {
    
    data.map(d => {d.Year = +d.Year})

    let nest = d3.nest().key(d => d.Winner).entries(data)
    console.log(nest)

    x.domain(data.map(d => d.Winner))
    y.domain([0, 5])
    console.log(data)
    xAxisGroup.call(xAxis)
    yAxisGroup.call(yAxis)

    const xLabel = elementGroup.append("text").text("Equipos campeones")
        .attr("transform", `translate (${(width - margin.left - margin.right)/2}, ${height - margin.top})`)
        .attr("text-align", "center")

    const yLabel = elementGroup.append("text").text("Mundiales Ganados")
        .attr("transform", `translate(${20}, ${130}) rotate(-90)`)

    let elements = elementGroup.selectAll("rect").data(nest)
    elements.enter().append("rect")
    .attr("fill", "lightblue")
    .attr("class", "elements")
    .attr("x", d => x(d.key))
    .attr("y", d => y(d.values.length))
    .attr("width", x.bandwidth())
    .attr("height", d => height - margin.bottom - margin.top - y(d.values.length))
})