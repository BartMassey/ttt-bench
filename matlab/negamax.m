% Copyright ?? 2012 Bart Massey
% [This program is licensed under the "MIT License"]
% Please see the file COPYING in the source
% distribution of this software for license terms.

% Perfect Tic-Tac-Toe player in Matlab / Octave

% Pseudocode:

% To calculate the negamax value of a position s:
%    If s is a final state (game over)
%        return the value of s to the side on move
%    v <- -1
%    for each legal move m in s
%       s' <- m(s)
%       v' <- -negamax(s')
%       if v' > v
%           v <- v'
%    return v

function v = negamax(onmove, S)
  % printf("tomove: %d\n", onmove);
  % S
  v = gamevalue(onmove, S);
  if v ~= -2   % game is over
    % printf("result: *%d\n", v);
    return
  end
  v = -1;
  for r = 1:3
    for c = 1:3
      if S(r, c) == 0
        % printf("examining %d %d\n", r, c);
        S(r, c) = onmove;
        v0 = -negamax(-onmove, S);
        if (v0 > v)
          v = v0;
        end
        S(r, c) = 0;
      end
    end
  end
  % printf("result: %d\n", v);
end
