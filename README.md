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
<img src="http://www.abrahamnunes.com/images/pqplot/pqscatter.svg" width="100%">

#### Actual vs. Estimate Scatterplots and Plotting Least Squares Regression Lines

This function was originally created to compare accuracy of a model-fitting algorithm's parameter estimates compared to the true ones. As such, there exists an option third argument in `pqscatter` which accepts a cell array containing one or more of `'match'`, which plots a diagonal line from the origin to the top right-hand corner, or `'lm'` which plots an ordinary least-squares regression line to the data series.

``` matlab

% Creating an Actual vs. Estimate PQ ScatterPlot

rng(123);
x = randn(100, 1);
y = 1.5*x + 0.2*randn(100, 1);

figure();
s = pqscatter(x, y, {'match'});
pqtitle(s, 'PQ Actual vs. Estimate Plot');
xlabel('Actual');
ylabel('Estimate');

```

<img src="http://www.abrahamnunes.com/images/pqplot/pqactualestimate.svg" width="100%">

``` matlab

% Creating an Actual vs. Estimate PQ ScatterPlot with an additional least squares fit line

rng(123);
x = randn(100, 1);
y = 1.5*x + 0.2*randn(100, 1);

figure();
s = pqscatter(x, y, {'match', 'lm'});
pqtitle(s, 'PQ Actual vs. Estimate Plot');
xlabel('Actual');
ylabel('Estimate');

```

<img src="http://www.abrahamnunes.com/images/pqplot/pqactualestimatelm.svg" width="100%">

#### Plotting multiple series with `pqscatter`

Just have `y`  be a matrix with each series you wish to plot as an individual column in that matrix.

``` matlab

% Plotting multiple series with pqscatter

rng(123);
x = randn(100, 1);
y = meshgrid(0.5:2.5, 1:100).*repmat(x, 1, 3) + 0.2*randn(100, 3);

figure();
s = pqscatter(x, y, {'match', 'lm'});
pqtitle(s, 'PQ Actual vs. Estimate Plot');
xlabel('Actual');
ylabel('Estimate');

```

<img src="http://www.abrahamnunes.com/images/pqplot/pqscattermulti.svg" width="100%">

### Bar Plots

Bar plots can be created with the `pqbar` function

``` matlab

% Bar plot with pqbar()

rng(123);
labelsx = {'A', 'B', 'C'};
y = rand(1, 3)*10;

figure();
s = pqbar(labelsx, y);
pqtitle(s, 'PQ Bar Plot');
ylabel('Values');

```

<img src="http://www.abrahamnunes.com/images/pqplot/pqbar.svg" width="100%">

The `pqbar` function can also plot multiple series per xlabel. Just add each series as a new column in the array `y`:

``` matlab

% Bar plot with pqbar()

rng(123);
labelsx = {'A', 'B', 'C'};
y = rand(3, 5)*10;

figure();
s = pqbar(labelsx, y);
pqtitle(s, 'PQ Bar Plot Multi-Series');
ylabel('Values');

```

<img src="http://www.abrahamnunes.com/images/pqplot/pqbarmulti.svg" width="100%">

# Issues

- [ ] Functions should become still more general
- [ ] There are some problems with labeling series (sometimes regression lines get labeled)
- [ ] Scatterplot points sometimes show up not perfectly rounded
- [ ] Fix labeling in correlogram
