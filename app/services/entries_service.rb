class EntriesService

    def compute_addon_cost(entry)
        total = 0
        entry.addons.each do |addon|
            total += (addon.item.price * addon.quantity)
        end

        total
    end

    def compute_time_cost(entry, price)
        total = 0
        elapsed_time = entry.elapsed_time
        if elapsed_time
            total = (elapsed_time / 60) * price
        end
        total
    end
end