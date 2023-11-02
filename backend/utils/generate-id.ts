import { ulid } from "ulidx";

const generateId = (existingId: string|undefined|null, prefix: string): string => {
    if (existingId) {
        return existingId
    }

    const id = ulid()
    return `${prefix}_${id}`
}

export default generateId
