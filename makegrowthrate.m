function gr = makegrowthrate(SNAvalues)

    gr = SNAvalues;
    gr(:,:,:) = 0;
    for t = 2:size(gr,3)
        gr(:,:,t) = (SNAvalues(:,:,t) - SNAvalues(:,:,t-1)) ./ SNAvalues(:,:,t);
    end
    gr(isnan(gr)) = 0;
    gr(isinf(gr)) = 0;
end