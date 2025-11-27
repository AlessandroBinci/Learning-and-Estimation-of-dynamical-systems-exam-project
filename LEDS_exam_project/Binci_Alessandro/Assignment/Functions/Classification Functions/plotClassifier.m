function plotClassifier(U, Y, Yhat, Theta, Title, classes)

% LDA plot: points (by class), mismatches, and decision boundaries (argmax).

    K = numel(classes);

    figure;
    hold on;
    grid on;
    axis equal;
    xlabel('U_1');
    ylabel('U_2');
    title(Title);

    % points of true class (inputs)
    cmap = lines(K); mks = {'o','^','s','d','x'};
    for i = 1:K
        idx = (Y == classes(i));
        plot(U(idx,1), U(idx,2), mks{mod(i-1,numel(mks))+1},'Color', cmap(i,:), 'MarkerSize', 6, 'DisplayName', sprintf('Class %s (true)', string(classes(i))));
    end

    %misclassified points (red X)
    miscl = (Yhat ~= Y);                                    %verifying the misclassification
    if any(miscl)
        plot(U(miscl,1), U(miscl,2), 'rx', 'MarkerSize', 8, 'LineWidth', 1.2, 'DisplayName', 'Mismatch');
    end

    % decision boundaries (true argmax boundaries)
    xg = linspace(min(U(:,1)), max(U(:,1)), 250);
    yg = linspace(min(U(:,2)), max(U(:,2)), 250);
    [Xg, Yg] = meshgrid(xg, yg);
    G = [Xg(:) Yg(:)];

    % scores of linear discriminant Z = [G 1]*Theta'
    Z = [G, ones(size(G,1),1)] * Theta.';          
    [~, idmax] = max(Z, [], 2);
    Zmap = reshape(double(grp2idx(categorical(classes(idmax)))), size(Xg));

    % drawing only where class changes
    contour(Xg, Yg, Zmap, 'k--', 'LineWidth', 1.2, 'HandleVisibility','off');

    legend('Location','northeastoutside','FontSize',8);     %print the legend
    hold off;
end
