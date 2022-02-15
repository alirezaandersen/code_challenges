## Movie Times

**Run Movie Scheduler**

```
   bundle install
   ruby movie_times.rb
```

## Movie Rules

###### Here is a list of the rules for each viewing of a movie:

- Each movie should start at easy to read times (eg 10:00, 10:05, 10:10).
- The start time of the movie is exactly at the posted start time.
- Each movie requires 15 minutes for previews before the start of the movie.
- Each movie requires 20 minutes after its end time to prepare the theater for the next
  movie

## Theater Rules

###### Here is a list of rules that are global to the cinema:

- No movie should end after the cinema’s hours of operation.
- The last showing should end as close as possible to the end of the cinema’s hours of
  operation.

**Hours of Operation**

The theater has the following hours of operation:

- Monday - Thursday 11am - 11pm.
- Friday - Sunday 10:30 am - 12 am.
- The cinema requires 15 minutes after opening before the first movie is shown.

**Requirements**

_Your system should be able to take in the details of each movie and output a start and end time of each show that abides by all of the provided rules. The runtime of each movie does not include time for previews or cleanup. The method of input can be interactive (GUI/Web/CLI) or via a structured input file format. The output of the system can also be via display or writing output files._

**Example Input:**

There’s Something About Mary (1998). Rated R. 134 minutes

The Imitation Game (2014). Rated PG-13. 114 minutes

The Hateful Eight (2015). Rated R. 187 minutes ●

Liar Liar (1997). Rated PG-13. 86 minutes

**Example Output:**

```
Liar Liar

Weekday
1:10 PM - 2:36 PM
3:15 PM - 4:41 PM
5:20 PM - 6:46 PM
7:25 PM - 8:51 PM
9:30 PM - 10:56 PM

Weekend
12:05 PM - 1:31 PM
2:10 PM - 3:36 PM
4:15 PM - 5:41 PM
6:20 PM - 7:46 PM
8:25 PM - 9:51 PM
10:30 PM - 11:56 PM`
```

### Would have like to do's

- Most likely would have made this into an app.
- Be Able to add a movie
- Update schedule logic to look at total number of movies vs screens to play on
