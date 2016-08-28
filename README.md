# PQPLOT

Some functions for easily generating publication quality plots in Matlab with all of the `set()` and `get()` stuff built in.

- Currently, this uses the viridis colourmap

## Examples

### Scatterplot

Scatterplots can be created with the `pqscatter` function. Title can be added with the `pqtitle` function, which takes the pqplot object `s` (in the example below) as the first argument.

``` matlab
% Creating a PQ ScatterPlot
rng(123);
x = randn(100, 1);
y = 1.5*x + 0.2*randn(100, 1);

figure();
s = pqscatter(x, y);
pqtitle(s, 'PQ Scatter Plot');
xlabel('X Label');
ylabel('Y Label');

```
<img src="http://www.abrahamnunes.com/images/pqplot/pqscatter.svg" width="100%" height="300">
