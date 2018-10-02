# Introduction to R

* [Day 1](day1.md)
* [Day 2](day2.md)
* [Day 3](day3.md)
* [Day 4](day4.md)
* [Day 5 & 6: plots](day56_plots.md)
* [Day 7 & 8: exploratory data analysis](day78_exploratory.md)

% Cat _layouts/default.html
<!DOCTYPE html>
<html>

  {% include head.html %}

  <body>

    {% include header.html %}

    <div class="page-content">
      <div id="left-side">
        {{ content | toc_generate }}
      </div>
      <p>here</p>
      <div class="wrapper">
        {{ content }}
      </div>
    </div>

    {% include footer.html %}

  </body>

</html>
