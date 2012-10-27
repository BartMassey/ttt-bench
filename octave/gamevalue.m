% Copyright © 2012 Bart Massey
% [This program is licensed under the "MIT License"]
% Please see the file COPYING in the source
% distribution of this software for license terms.

% Perfect Tic-Tac-Toe player in Matlab / Octave


% Returns the value of the game to the
% side on move if the game is over, or
% -2 if the game is still in progress.
function v = gamevalue(onmove, S)
  % first scan for wins
  for side = [-onmove, onmove]
    v = side * onmove;
    % scan for diagonal
    n = 0;
    for d = 1:3
      if S(d, d) == side
        n = n + 1;
      end
    end
    if n == 3
      return
    end
    % scan for opposite diagonal
    n = 0;
    for d = 1:3
      if S(d, 4 - d) == side
        n = n + 1;
      end
    end  
    if n == 3
      return
    end
    % scan for rows
    for r = 1:3
      n = 0;
      for c = 1:3
        if S(r, c) == side
          n = n + 1;
        end
      end  
      if n == 3
        return
      end
    end
    % scan for cols
    for c = 1:3
      n = 0;
      for r = 1:3
        if S(r, c) == side
          n = n + 1;
        end
      end
      if n == 3
        return
      end
    end
  end
  % scan for blanks
  v = -2;   % game not over
  for r = 1:3
    for c = 1:3
      if S(r, c) == 0
        return
      end
    end
  end
  % game is a draw
  v = 0;
end
