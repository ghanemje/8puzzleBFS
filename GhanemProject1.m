% By Ghanem Jamal Eddine 116393744
% 8-puzzle solver by Breadth-First Search

clc
clear

% store output files needed
save('Nodes.txt')
save('NodesInfo.txt','-ascii')
save('nodePath.txt','-ascii')

fprintf('Example:\n0 1 3\n4 2 5\n7 8 6 is [0 1 3;4 2 5; 7 8 6]\n') % prompt user to enter initial matrix
Node_init = input('Enter initial matrix\n');
Node_init = reshape(Node_init,1,9); % reshape given matrix for easier manipulation


Goalstate = [1 4 7 2 5 8 3 6 0]; % define goal state
GoalstateID = sprintf('%d%d%d%d%d%d%d%d%d',Goalstate(1,1),Goalstate(1,2),Goalstate(1,3),Goalstate(1,4),Goalstate(1,5),Goalstate(1,6),Goalstate(1,7),Goalstate(1,8),Goalstate(1,9));
% store goalstate as a 1x1 string

if Node_init == Goalstate
    disp('Entered matrix is goal matrix')
    return
end

pw = Node_init; % node worked with
pn = zeros(5,9); % node storage array

pn(1,:) = pw;

% converting each node to a unique ID (ex: node [1 2 3 4 5 6 7 8 0] has an
% ID of 123456780, then ID is stored in array pIDm
pID  = sprintf('%d%d%d%d%d%d%d%d%d',pn(1,1),pn(1,2),pn(1,3),pn(1,4),pn(1,5),pn(1,6),pn(1,7),pn(1,8),pn(1,9));

pIDm{:} = pID;
pIDm{2,1} = pID;
pIDm{3,1} = pID;
pIDm{4,1} = pID;
pIDm{5,1} = pID;


prt = zeros(90720,4); %stores every node parents&children 9!/4 = 90720

s = 1; %number of new node or position

nodesinfo = [1 0 0]; %nodesinfo of initial matrix



for y = 1:362880 %9! = every possible combination of 3x3 matrix

    fprintf('%s%d%s%d\n','Number of iterations:',y,' with number of nodes: ',s);

    a = find(pw==0); %find blank position
    p1 = pw; %We have at least 4 moves so we need 4 arrays for replacement
    p2 = pw;
    p3 = pw;
    p4 = pw;
    r = 1; %the colum number of childs in parents list
    if a == 1
        p1(1) = pw(2); %replace the 0 value by the 2nd value
        p1(2) = pw(1); %store it in p1 as a new child
        s = length(find(any(pn,2)))+1; %the position of next child to be in the list

        pID = sprintf('%d%d%d%d%d%d%d%d%d',p1(1,1),p1(1,2),p1(1,3),p1(1,4),p1(1,5),p1(1,6),p1(1,7),p1(1,8),p1(1,9));

        if ismember(pID,pIDm) == 0 %if p1 is not repeated in the list
            pIDm{s,1} = pID;
            pn(s,:) = p1; %add p1 in the next row of the list
            prt(y,r) = s; %children of a parent will be stored in a row
            r = r + 1; % The next children column position
        end
        p2(1) = pw(4);
        p2(4) = pw(1);
        s = length(find(any(pn,2)))+1; %the position of next child to be in the list

        pID = sprintf('%d%d%d%d%d%d%d%d%d',p2(1,1),p2(1,2),p2(1,3),p2(1,4),p2(1,5),p2(1,6),p2(1,7),p2(1,8),p2(1,9));


        if ismember(pID,pIDm) == 0 %if p1 is not repeated in the list
            pIDm{s,1} = pID;
            pn(s,:) = p2; %add p1 in the next row of the list
            prt(y,r) = s; %children of a parent will be stored in a row
            r = r + 1; % The next children column position
        end
    end
    if a == 2
        p1(2) = pw(1); %replace the 0 value by the 2nd value
        p1(1) = pw(2); %store it in p1 as a new child
        s = length(find(any(pn,2)))+1; %the position of next child to be in the list

        pID = sprintf('%d%d%d%d%d%d%d%d%d',p1(1,1),p1(1,2),p1(1,3),p1(1,4),p1(1,5),p1(1,6),p1(1,7),p1(1,8),p1(1,9));

        if ismember(pID,pIDm) == 0 %if p1 is not repeated in the list
            pIDm{s,1} = pID;
            pn(s,:) = p1; %add p1 in the next row of the list
            prt(y,r) = s; %children of a parent will be stored in a row
            r = r + 1; % The next children column position
        end
        p2(2) = pw(3);
        p2(3) = pw(2);
        s = length(find(any(pn,2)))+1; %the position of next child to be in the list

        pID = sprintf('%d%d%d%d%d%d%d%d%d',p2(1,1),p2(1,2),p2(1,3),p2(1,4),p2(1,5),p2(1,6),p2(1,7),p2(1,8),p2(1,9));

        if ismember(pID,pIDm) == 0 %if p1 is not repeated in the list
            pIDm{s,1} = pID;
            pn(s,:) = p2; %add p1 in the next row of the list
            prt(y,r) = s; %children of a parent will be stored in a row
            r = r + 1; % The next children column position
        end
        p3(2) = pw(5);
        p3(5) = pw(2);
        s = length(find(any(pn,2)))+1; %the position of next child to be in the list

        pID = sprintf('%d%d%d%d%d%d%d%d%d',p3(1,1),p3(1,2),p3(1,3),p3(1,4),p3(1,5),p3(1,6),p3(1,7),p3(1,8),p3(1,9));

        if ismember(pID,pIDm) == 0 %if p1 is not repeated in the list
            pIDm{s,1} = pID;
            pn(s,:) = p3; %add p1 in the next row of the list
            prt(y,r) = s; %children of a parent will be stored in a row
            r = r + 1; % The next children column position
        end
    end
    if a == 3
        p1(3) = pw(2); %replace the 0 value by the 2nd value
        p1(2) = pw(3); %store it in p1 as a new child
        s = length(find(any(pn,2)))+1; %the position of next child to be in the list

        pID = sprintf('%d%d%d%d%d%d%d%d%d',p1(1,1),p1(1,2),p1(1,3),p1(1,4),p1(1,5),p1(1,6),p1(1,7),p1(1,8),p1(1,9));

        if ismember(pID,pIDm) == 0 %if p1 is not repeated in the list
            pIDm{s,1} = pID;
            pn(s,:) = p1; %add p1 in the next row of the list
            prt(y,r) = s; %children of a parent will be stored in a row
            r = r + 1; % The next children column position
        end
        p2(3) = pw(6);
        p2(6) = pw(3);
        s = length(find(any(pn,2)))+1; %the position of next child to be in the list
        pID = sprintf('%d%d%d%d%d%d%d%d%d',p2(1,1),p2(1,2),p2(1,3),p2(1,4),p2(1,5),p2(1,6),p2(1,7),p2(1,8),p2(1,9));

        if ismember(pID,pIDm) == 0 %if p1 is not repeated in the list
            pIDm{s,1} = pID;
            pn(s,:) = p2; %add p1 in the next row of the list
            prt(y,r) = s; %children of a parent will be stored in a row
            r = r + 1; % The next children column position
        end
    end

    if a == 4
        p1(4) = pw(1); %replace the 0 value by the 2nd value
        p1(1) = pw(4); %store it in p1 as a new child
        s = length(find(any(pn,2)))+1; %the position of next child to be in the list

        pID = sprintf('%d%d%d%d%d%d%d%d%d',p1(1,1),p1(1,2),p1(1,3),p1(1,4),p1(1,5),p1(1,6),p1(1,7),p1(1,8),p1(1,9));

        if ismember(pID,pIDm) == 0 %if p1 is not repeated in the list
            pIDm{s,1} = pID;
            pn(s,:) = p1; %add p1 in the next row of the list
            prt(y,r) = s; %children of a parent will be stored in a row
            r = r + 1; % The next children column position
        end
        p2(4) = pw(5);
        p2(5) = pw(4);
        s = length(find(any(pn,2)))+1; %the position of next child to be in the list
        pID = sprintf('%d%d%d%d%d%d%d%d%d',p2(1,1),p2(1,2),p2(1,3),p2(1,4),p2(1,5),p2(1,6),p2(1,7),p2(1,8),p2(1,9));

        if ismember(pID,pIDm) == 0 %if p1 is not repeated in the list
            pIDm{s,1} = pID;
            pn(s,:) = p2; %add p1 in the next row of the list
            prt(y,r) = s; %children of a parent will be stored in a row
            r = r + 1; % The next children column position
        end
        p3(4) = pw(7);
        p3(7) = pw(4);
        s = length(find(any(pn,2)))+1; %the position of next child to be in the list

        pID = sprintf('%d%d%d%d%d%d%d%d%d',p3(1,1),p3(1,2),p3(1,3),p3(1,4),p3(1,5),p3(1,6),p3(1,7),p3(1,8),p3(1,9));

        if ismember(pID,pIDm) == 0 %if p1 is not repeated in the list
            pIDm{s,1} = pID;
            pn(s,:) = p3; %add p1 in the next row of the list
            prt(y,r) = s; %children of a parent will be stored in a row
            r = r + 1; % The next children column position
        end
    end
    if a == 5
        p1(5) = pw(2); %replace the 0 value by the 2nd value
        p1(2) = pw(5); %store it in p1 as a new child
        s = length(find(any(pn,2)))+1; %the position of next child to be in the list

        pID = sprintf('%d%d%d%d%d%d%d%d%d',p1(1,1),p1(1,2),p1(1,3),p1(1,4),p1(1,5),p1(1,6),p1(1,7),p1(1,8),p1(1,9));

        if ismember(pID,pIDm) == 0 %if p1 is not repeated in the list
            pIDm{s,1} = pID;
            pn(s,:) = p1; %add p1 in the next row of the list
            prt(y,r) = s; %children of a parent will be stored in a row
            r = r + 1; % The next children column position
        end
        p2(5) = pw(4);
        p2(4) = pw(5);
        s = length(find(any(pn,2)))+1; %the position of next child to be in the list
        pID = sprintf('%d%d%d%d%d%d%d%d%d',p2(1,1),p2(1,2),p2(1,3),p2(1,4),p2(1,5),p2(1,6),p2(1,7),p2(1,8),p2(1,9));

        if ismember(pID,pIDm) == 0 %if p1 is not repeated in the list
            pIDm{s,1} = pID;
            pn(s,:) = p2; %add p1 in the next row of the list
            prt(y,r) = s; %children of a parent will be stored in a row
            r = r + 1; % The next children column position
        end
        p3(5) = pw(6);
        p3(6) = pw(5);
        s = length(find(any(pn,2)))+1; %the position of next child to be in the list

        pID = sprintf('%d%d%d%d%d%d%d%d%d',p3(1,1),p3(1,2),p3(1,3),p3(1,4),p3(1,5),p3(1,6),p3(1,7),p3(1,8),p3(1,9));

        if ismember(pID,pIDm) == 0 %if p1 is not repeated in the list
            pIDm{s,1} = pID;
            pn(s,:) = p3; %add p1 in the next row of the list
            prt(y,r) = s; %children of a parent will be stored in a row
            r = r + 1; % The next children column position
        end
        p4(5) = pw(8);
        p4(8) = pw(5);
        s = length(find(any(pn,2)))+1; %the position of next child to be in the list
        pID = sprintf('%d%d%d%d%d%d%d%d%d',p4(1,1),p4(1,2),p4(1,3),p4(1,4),p4(1,5),p4(1,6),p4(1,7),p4(1,8),p4(1,9));

        if ismember(pID,pIDm) == 0 %if p1 is not repeated in the list
            pIDm{s,1} = pID;
            pn(s,:) = p4; %add p1 in the next row of the list
            prt(y,r) = s; %children of a parent will be stored in a row
            r = r + 1; % The next children column position
        end
    end
    if a == 6
        p1(6) = pw(3); %replace the 0 value by the 2nd value
        p1(3) = pw(6); %store it in p1 as a new child
        s = length(find(any(pn,2)))+1; %the position of next child to be in the list

        pID = sprintf('%d%d%d%d%d%d%d%d%d',p1(1,1),p1(1,2),p1(1,3),p1(1,4),p1(1,5),p1(1,6),p1(1,7),p1(1,8),p1(1,9));

        if ismember(pID,pIDm) == 0 %if p1 is not repeated in the list
            pIDm{s,1} = pID;
            pn(s,:) = p1; %add p1 in the next row of the list
            prt(y,r) = s; %children of a parent will be stored in a row
            r = r + 1; % The next children column position
        end
        p2(6) = pw(5);
        p2(5) = pw(6);
        s = length(find(any(pn,2)))+1; %the position of next child to be in the list
        pID = sprintf('%d%d%d%d%d%d%d%d%d',p2(1,1),p2(1,2),p2(1,3),p2(1,4),p2(1,5),p2(1,6),p2(1,7),p2(1,8),p2(1,9));

        if ismember(pID,pIDm) == 0 %if p1 is not repeated in the list
            pIDm{s,1} = pID;
            pn(s,:) = p2; %add p1 in the next row of the list
            prt(y,r) = s; %children of a parent will be stored in a row
            r = r + 1; % The next children column position
        end
        p3(6) = pw(9);
        p3(9) = pw(6);
        s = length(find(any(pn,2)))+1; %the position of next child to be in the list

        pID = sprintf('%d%d%d%d%d%d%d%d%d',p3(1,1),p3(1,2),p3(1,3),p3(1,4),p3(1,5),p3(1,6),p3(1,7),p3(1,8),p3(1,9));

        if ismember(pID,pIDm) == 0 %if p1 is not repeated in the list
            pIDm{s,1} = pID;
            pn(s,:) = p3; %add p1 in the next row of the list
            prt(y,r) = s; %children of a parent will be stored in a row
            r = r + 1; % The next children column position
        end
    end
    if a == 7
        p1(7) = pw(4); %replace the 0 value by the 2nd value
        p1(4) = pw(7); %store it in p1 as a new child
        s = length(find(any(pn,2)))+1; %the position of next child to be in the list

        pID = sprintf('%d%d%d%d%d%d%d%d%d',p1(1,1),p1(1,2),p1(1,3),p1(1,4),p1(1,5),p1(1,6),p1(1,7),p1(1,8),p1(1,9));

        if ismember(pID,pIDm) == 0 %if p1 is not repeated in the list
            pIDm{s,1} = pID;
            pn(s,:) = p1; %add p1 in the next row of the list
            prt(y,r) = s; %children of a parent will be stored in a row
            r = r + 1; % The next children column position
        end
        p2(7) = pw(8);
        p2(8) = pw(7);
        s = length(find(any(pn,2)))+1; %the position of next child to be in the list
        pID = sprintf('%d%d%d%d%d%d%d%d%d',p2(1,1),p2(1,2),p2(1,3),p2(1,4),p2(1,5),p2(1,6),p2(1,7),p2(1,8),p2(1,9));

        if ismember(pID,pIDm) == 0 %if p1 is not repeated in the list
            pIDm{s,1} = pID;
            pn(s,:) = p2; %add p1 in the next row of the list
            prt(y,r) = s; %children of a parent will be stored in a row
            r = r + 1; % The next children column position
        end
    end
    if a == 8
        p1(8) = pw(5); %replace the 0 value by the 2nd value
        p1(5) = pw(8); %store it in p1 as a new child
        s = length(find(any(pn,2)))+1; %the position of next child to be in the list

        pID = sprintf('%d%d%d%d%d%d%d%d%d',p1(1,1),p1(1,2),p1(1,3),p1(1,4),p1(1,5),p1(1,6),p1(1,7),p1(1,8),p1(1,9));

        if ismember(pID,pIDm) == 0 %if p1 is not repeated in the list
            pIDm{s,1} = pID;
            pn(s,:) = p1; %add p1 in the next row of the list
            prt(y,r) = s; %children of a parent will be stored in a row
            r = r + 1; % The next children column position
        end
        p2(8) = pw(7);
        p2(7) = pw(8);
        s = length(find(any(pn,2)))+1; %the position of next child to be in the list
        pID = sprintf('%d%d%d%d%d%d%d%d%d',p2(1,1),p2(1,2),p2(1,3),p2(1,4),p2(1,5),p2(1,6),p2(1,7),p2(1,8),p2(1,9));

        if ismember(pID,pIDm) == 0 %if p1 is not repeated in the list
            pIDm{s,1} = pID;
            pn(s,:) = p2; %add p1 in the next row of the list
            prt(y,r) = s; %children of a parent will be stored in a row
            r = r + 1; % The next children column position
        end
        p3(8) = pw(9);
        p3(9) = pw(8);
        s = length(find(any(pn,2)))+1; %the position of next child to be in the list

        pID = sprintf('%d%d%d%d%d%d%d%d%d',p3(1,1),p3(1,2),p3(1,3),p3(1,4),p3(1,5),p3(1,6),p3(1,7),p3(1,8),p3(1,9));

        if ismember(pID,pIDm) == 0 %if p1 is not repeated in the list
            pIDm{s,1} = pID;
            pn(s,:) = p3; %add p1 in the next row of the list
            prt(y,r) = s; %children of a parent will be stored in a row
            r = r + 1; % The next children column position
        end
    end
    if a == 9
        p1(9) = pw(6); %replace the 0 value by the 2nd value
        p1(6) = pw(9); %store it in p1 as a new child
        s = length(find(any(pn,2)))+1; %the position of next child to be in the list
        pID = sprintf('%d%d%d%d%d%d%d%d%d',p1(1,1),p1(1,2),p1(1,3),p1(1,4),p1(1,5),p1(1,6),p1(1,7),p1(1,8),p1(1,9));

        if ismember(pID,pIDm) == 0 %if p1 is not repeated in the list
            pIDm{s,1} = pID;
            pn(s,:) = p1; %add p1 in the next row of the list
            prt(y,r) = s; %children of a parent will be stored in a row
            r = r + 1; % The next children column position
        end
        p2(9) = pw(8);
        p2(8) = pw(9);
        s = length(find(any(pn,2)))+1; %the position of next child to be in the list
        pID = sprintf('%d%d%d%d%d%d%d%d%d',p2(1,1),p2(1,2),p2(1,3),p2(1,4),p2(1,5),p2(1,6),p2(1,7),p2(1,8),p2(1,9));

        if ismember(pID,pIDm) == 0 %if p1 is not repeated in the list
            pIDm{s,1} = pID;
            pn(s,:) = p2; %add p1 in the next row of the list
            prt(y,r) = s; %children of a parent will be stored in a row
            r = r + 1; % The next children column position
        end
    end

    pw = pn(y+1,:); %in the next iteration we are working on the next node so we choose it

    if ismember(GoalstateID, pIDm(end-4:end)) == 1 %Determine which rows of A are also in B as well as their corresponding locations in B.
        disp('Puzzle Solved!')

        path = s; %finding the path
        while(isempty(j) == 0) %while j is not empty, execute
            [j,~] = find(path(1) == prt);
            path = [j path];
        end
        for i = path %print initial to goal states
            save('Nodes.txt','pn','-ascii') %Nodes.txt
            for o = 2 : length(pn)
                NodeNo = o;
                oo = find(prt == o);
                if ( oo >= 90720 && oo < 2*90720) % correcting value given by find function
                    oo = oo-90720;
                else if (oo >= 2*90710) % correcting value given by find function
                    oo = (oo-(2*90720));
                    end
                end  
                ParentNo = oo; % parent number is oo after correction

                path = o; % finding path to find cost to come
                www=1;
                while(isempty(www) == 0) %while j is not empty, execute
                    [www,~] = find(path(1) == prt);
                    path = [www path];
                end
                C2C = length(path)-1; %cost to come
                nodesinfo(o,:) = [NodeNo ParentNo C2C]; %store all variables in nodesinfo
            end
            xx = pn(i,:);
            save('nodePath.txt','xx','-ascii','-append') %nodePath.txt
            reshape(pn(i,:),3,3) %display puzzle path output
        end
        save('NodesInfo.txt','nodesinfo','-ascii','-append') %NodesInfo.txt
        fprintf('%s%d%s%d\n','Number of iterations:',y,' with number of nodes: ',s);
        break
    end
end
if y == 362880/2 % if all possible nodes are explored, no solution exists to the given puzzle
    fprintf('No Solution Exists')
end
