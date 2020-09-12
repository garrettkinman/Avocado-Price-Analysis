### A Pluto.jl notebook ###
# v0.11.2

using Markdown
using InteractiveUtils

# ╔═╡ 3e1811d0-f513-11ea-2b83-05cd42ff8bf9
md"## Data Analysis
1.  Price vs Volume
2.  Price vs Region
3.  Price vs Month
4.  Price vs Type"

# ╔═╡ c94fdee0-f513-11ea-38b6-e95f27de85bb


# ╔═╡ 54a16062-f512-11ea-17ae-f18d96e5ae5d
begin
	using DataFrames
	using CSV
	using Plots
	using Pipe
end

# ╔═╡ 5d506dee-f512-11ea-07eb-e761b322d3be
avocado_prices = CSV.read("avocado.csv")

# ╔═╡ fb57c070-f512-11ea-338e-ef92ca1fa317
rename!(avocado_prices, :"Column1" => :"id", :"4046" => :"Small Hass", :"4225" => :"Large Hass", :"4770" => :"XLarge Hass")

# ╔═╡ 894d26e0-f513-11ea-3ccb-db999354d3b2
grouped_prices = groupby(avocado_prices, :"region")

# ╔═╡ b6d975f0-f513-11ea-14a9-89bcff2918e1
albany_prices = grouped_prices[("Albany",)]

# ╔═╡ 9c37ae60-f513-11ea-3400-e9b0ce82d639
max = @pipe albany_prices[!, :"Total Volume"] |>
            extrema(_)[2] * 1.1 |> 
            round(_) |>
            convert(Int, _)

# ╔═╡ aeb56a50-f513-11ea-3f6c-1d49f3700c58
scatter(albany_prices[!, :"Total Volume"], albany_prices[!, :"AveragePrice"])

# ╔═╡ Cell order:
# ╠═54a16062-f512-11ea-17ae-f18d96e5ae5d
# ╠═5d506dee-f512-11ea-07eb-e761b322d3be
# ╠═fb57c070-f512-11ea-338e-ef92ca1fa317
# ╠═3e1811d0-f513-11ea-2b83-05cd42ff8bf9
# ╠═894d26e0-f513-11ea-3ccb-db999354d3b2
# ╠═b6d975f0-f513-11ea-14a9-89bcff2918e1
# ╠═9c37ae60-f513-11ea-3400-e9b0ce82d639
# ╠═aeb56a50-f513-11ea-3f6c-1d49f3700c58
# ╠═c94fdee0-f513-11ea-38b6-e95f27de85bb
