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

    def generate_id
        entry = Entry.order("created_at").last
        if entry
            generated_id = entry.customer_number.to_i + 1
            if entry.created_at.to_date != Date.today
                generated_id = 1
            end
        else
            generated_id = 1
        end
        generated_id
    end
end